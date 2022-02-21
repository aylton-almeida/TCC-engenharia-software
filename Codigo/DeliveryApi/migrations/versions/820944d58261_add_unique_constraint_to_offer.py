"""add unique constraint to offer

Revision ID: 820944d58261
Revises: 523676d793c0
Create Date: 2022-02-19 20:47:49.781071

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '820944d58261'
down_revision = '523676d793c0'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('delivery_addresses', 'lat',
               existing_type=sa.REAL(),
               type_=sa.Float(precision=10, asdecimal=8),
               existing_nullable=True)
    op.alter_column('delivery_addresses', 'lng',
               existing_type=sa.REAL(),
               type_=sa.Float(precision=11, asdecimal=8),
               existing_nullable=True)
    op.create_unique_constraint(None, 'delivery_deliveries', ['offer_id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'delivery_deliveries', type_='unique')
    op.alter_column('delivery_addresses', 'lng',
               existing_type=sa.Float(precision=11, asdecimal=8),
               type_=sa.REAL(),
               existing_nullable=True)
    op.alter_column('delivery_addresses', 'lat',
               existing_type=sa.Float(precision=10, asdecimal=8),
               type_=sa.REAL(),
               existing_nullable=True)
    # ### end Alembic commands ###
