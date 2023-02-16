from chatbot_data_processing import index

def test_index():
    assert index.hello() == "Hello data-processing"
