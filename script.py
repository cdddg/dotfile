import requests
import re


def get_python_special_method_names():
    resp = requests.get('https://docs.python.org/3/reference/datamodel.html#special-method-names')
    python_builts = set(re.findall(r'__[a-z_A-Z]*__', resp.text))
    print(
        str(sorted(python_builts)).replace('\'', '').replace(', ', ' ')[1:-1]
    )

