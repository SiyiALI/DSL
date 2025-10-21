import type { ValidationAcceptor } from 'langium';
import type { Board, Game } from '../../packages/language/out/generated/ast.js';

export function registerBoardRaceValidationChecks(services: any) {
    const registry = services.validation.ValidationRegistry;
    const validator = new BoardRaceValidator();
    registry.register(validator);
}

export class BoardRaceValidator {

    // Règle 1 : vérifie la taille du plateau
    checkBoardCellRange(board: Board, accept: ValidationAcceptor): void {
        const cells = board.size;
        if (cells < 10 || cells > 200) {
            accept(
                'error',
                `Le nombre de cases (${cells}) doit être entre 10 et 200.`,
                { node: board, property: 'size' }
            );
        }
    }

    // Règle 2 : vérifie que le nombre de joueurs est entre 2 et 6
    checkNumberOfPlayers(game: Game, accept: ValidationAcceptor): void {
        const players = game.players?.players ?? [];
        const count = players.length;

        if (count < 2 || count > 6) {
            accept(
                'error',
                `Le nombre de joueurs (${count}) doit être compris entre 2 et 6.`,
                { node: game.players }
            );
        }
    }
     
    checkWinEffectPosition(board: Board, accept: ValidationAcceptor): void {
    const lastIndex = board.size;

    for (const cell of board.specials ?? []) {
        const effect = cell.effect;

        if (typeof effect === 'string' && effect === 'win') {
            if (cell.index !== lastIndex) {
                accept(
                    'error',
                    `L'effet 'win' doit être placé uniquement sur la dernière case (${lastIndex}).`,
                    { node: cell, property: 'index' }
                );
            }
        } else if ((effect as any)?.$type === 'Win') {
            if (cell.index !== lastIndex) {
                accept(
                    'error',
                    `L'effet 'win' doit être placé uniquement sur la dernière case (${lastIndex}).`,
                    { node: cell, property: 'index' }
                );
            }
        }
    }
    }

}
