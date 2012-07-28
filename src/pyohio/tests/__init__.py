from unittest import TestCase

import pyohio

class TestHello(TestCase):
    """Hello is such a powerful tool!"""

    def test_hello_sucess(self):
        """The power of hello is with you."""
        self.assertTrue(pyohio.main().startswith('Hello'),
                        "Starts with 'Hello'")
