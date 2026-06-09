-- ============================================================
-- V3__seed_classic_flavors.sql
-- População dos sabores clássicos e seus ingredientes
-- ============================================================

-- Inserir sabores clássicos com IDs explícitos
INSERT INTO classic_flavor (id, name, base_price) VALUES
    (1, 'Macchiato',   8.00),
    (2, 'Latte',       9.00),
    (3, 'Mocha',       9.00),
    (4, 'Affogato',   10.00),
    (5, 'Chocolatudo', 30.00);

-- Relacionamentos sabor <-> ingredientes
INSERT INTO classic_flavor_ingredients (flavor_id, ingredient_id) VALUES
    (1, 1),  -- Macchiato  -> Espresso
    (1, 2),  -- Macchiato  -> Leite
    (1, 3),  -- Macchiato  -> Espuma
    (2, 1),  -- Latte      -> Espresso
    (2, 2),  -- Latte      -> Leite
    (3, 1),  -- Mocha      -> Espresso
    (3, 2),  -- Mocha      -> Leite
    (3, 5),  -- Mocha      -> Chocolate
    (4, 1),  -- Affogato   -> Espresso
    (4, 4),  -- Affogato   -> Sorvete
    (5, 4),  -- Chocolatudo -> Sorvete
    (5, 5);  -- Chocolatudo -> Chocolate
