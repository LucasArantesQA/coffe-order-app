-- ============================================================
-- V2__seed_ingredients.sql
-- População dos ingredientes base do catálogo
-- ============================================================

INSERT INTO ingredient (name, type, price, stock_quantity, active) VALUES
    ('Espresso',   'BASE',       5.00, 100, TRUE),
    ('Leite',      'BASE',       3.00, 100, TRUE),
    ('Espuma',     'BASE',       2.00, 100, TRUE),
    ('Sorvete',    'BASE',       6.00, 100, TRUE),
    ('Chocolate',  'BASE',       4.00, 100, TRUE),
    ('Chantilly',  'ADDITIONAL', 2.00, 100, TRUE),
    ('Canela',     'ADDITIONAL', 1.00, 100, TRUE),
    ('Caramelo',   'ADDITIONAL', 3.00, 100, TRUE);
