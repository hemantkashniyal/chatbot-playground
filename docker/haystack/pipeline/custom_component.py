"""
Pipelines allow putting together Components to build a graph.

In addition to the standard Haystack Components, custom user-defined Components
can be used in a Pipeline YAML configuration.

The classes for the Custom Components must be defined in this file.
"""
import inspect

from typing import List, Optional, Union, Dict, Any
from haystack.schema import Document, MultiLabel
from haystack.nodes.base import BaseComponent
from haystack.nodes import PromptNode


class MyCustomComponent(BaseComponent):
    outgoing_edges: int = 1

    def __init__(self):
        pass
        # Initalize the node passing the model:
        # self.prompt_node = PromptNode(model_name_or_path="google/flan-t5-xl")

    def run(self, documents, **kwargs): # type: ignore
        print("@#@# kwargs", documents, kwargs)
        print("@#@# kwargs", kwargs)
        # data  = self.prompt_node("What is the best city in Europe to live in?")
        output = {
            "documents": "NA",
            "_debug": {"anything": "you want"}
        }
        print("@#@# test output: {}".format(output))
        return output, "output_1"

    def run_batch(self, **kwargs): # type: ignore
        pass