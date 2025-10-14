import type { ValidationChecks } from 'langium';
import type { BoardRaceAstType } from './generated/ast.js';
import type { BoardRaceServices } from './board-race-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: BoardRaceServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.BoardRaceValidator;
    const checks: ValidationChecks<BoardRaceAstType> = {
        // TODO: Declare validators for your properties
        // See doc : https://langium.org/docs/learn/workflow/create_validations/
        /*
        Element: validator.checkElement
        */
    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class BoardRaceValidator {

    // TODO: Add logic here for validation checks of properties
    // See doc : https://langium.org/docs/learn/workflow/create_validations/
    /*
    checkElement(element: Element, accept: ValidationAcceptor): void {
        // Always accepts
    }
    */
}
