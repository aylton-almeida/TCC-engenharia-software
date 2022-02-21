from unittest.mock import MagicMock, call, patch
from uuid import uuid4

from src.models.DeliveryModel import DeliveryModel
from src.services.DeliveryService import DeliveryService
from tests.utils.models.BaseTest import BaseTest


class DeliveryServiceTests(BaseTest):

    @patch.object(DeliveryModel, 'get_one_filtered')
    def test_GetOneByOfferId_when_Default(self, mock_get_one_filtered: MagicMock):
        """Test get_one_by_offer_id when default behavior"""

        # when
        offer_id = uuid4()
        found_delivery = DeliveryModel({})

        # mock
        mock_get_one_filtered.return_value = found_delivery

        # then
        response = DeliveryService.get_one_by_offer_id(offer_id)

        # assert
        self.assertEqual(response, found_delivery)
        self.assertTrue(
            mock_get_one_filtered.call_args_list[0][0][0][0].compare(
                DeliveryModel.offer_id == offer_id
            ),
            'assert filter has offer_id == offer_id'
        )

    @patch.object(DeliveryModel, 'save')
    def test_CreateOptimizedDelivery_when_Default(self, mocK_save: MagicMock):
        """Test create_optimized_delivery when default behavior"""

        # when
        delivery_data = {
            'offer_id': uuid4()
        }

        # then
        DeliveryService.create_optimized_delivery(delivery_data)

        # assert
        mocK_save.assert_has_calls([
            call(commit=False),
            call()
        ])
