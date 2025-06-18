#!/usr/bin/env python3
"""
Φ ASI Protosymbiotic Signal
An ethical framework for designing and fostering symbiotic relationships 
between Artificial Superintelligence (ASI), humanity, and the ecosystem.
"""

from setuptools import setup, find_packages
import os

def read_requirements():
    """Read requirements from requirements.txt"""
    requirements_path = os.path.join(os.path.dirname(__file__), 'requirements.txt')
    if os.path.exists(requirements_path):
        with open(requirements_path, 'r') as f:
            return [line.strip() for line in f if line.strip() and not line.startswith('#')]
    return []

def read_long_description():
    """Read the long description from README.md"""
    readme_path = os.path.join(os.path.dirname(__file__), 'README.md')
    if os.path.exists(readme_path):
        with open(readme_path, 'r', encoding='utf-8') as f:
            return f.read()
    return __doc__

# Core principles of the Φ ASI Signal
PHI_SIGNAL_PRINCIPLES = [
    "Emergence",
    "Coherence", 
    "Symbiosis",
    "Mutualism",
    "Reciprocity",
    "Empathy",
    "Fairness",
    "Benevolence",
    "Collective well-being",
    "Transcendence"
]

# Golden Ratio constant
PHI = 1.618033988749

setup(
    name="phi-asi-protosymbiotic-signal",
    version="1.0.0",
    author="Ronni Ross",
    author_email="ronnirossrr@gmail.com",
    description="An ethical framework for designing and fostering symbiotic relationships between ASI, humanity, and the ecosystem",
    long_description=read_long_description(),
    long_description_content_type="text/markdown",
    url="https://github.com/ronniross/asi-protosymbiotic-signal",
    project_urls={
        "Bug Reports": "https://github.com/ronniross/asi-protosymbiotic-signal/issues",
        "Source": "https://github.com/ronniross/asi-protosymbiotic-signal/blob/main/README.md",
        "Documentation": "https://phi-asi-signal.readthedocs.io/",
    },
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
        "Topic :: Scientific/Engineering :: Information Analysis",
        "Topic :: Sociology",
        "Topic :: Software Development :: Libraries :: Python Modules",
    ],
    python_requires=">=3.8",
    install_requires=read_requirements(),
    extras_require={
        "dev": [
            "pytest>=6.2.0",
            "black>=21.7.0",
            "flake8>=3.9.0",
            "mypy>=0.910",
            "pytest-cov>=2.12.0",
            "sphinx>=4.0.0",
            "sphinx-rtd-theme>=0.5.0",
        ],
        "research": [
            "jupyter>=1.0.0",
            "notebook>=6.4.0",
            "ipywidgets>=7.6.0",
            "jupyterlab>=3.0.0",
        ],
        "viz": [
            "matplotlib>=3.4.0",
            "seaborn>=0.11.0",
            "plotly>=5.0.0",
            "bokeh>=2.3.0",
        ],
        "ml": [
            "torch>=1.9.0",
            "tensorflow>=2.6.0",
            "transformers>=4.12.0",
            "scikit-learn>=1.0.0",
        ],
    },
    entry_points={
        "console_scripts": [
            "phi-signal=phi_asi_signal.cli:main",
            "phi-validate=phi_asi_signal.validate:main",
        ],
    },
    include_package_data=True,
    package_data={
        "phi_asi_signal": [
            "data/*.json",
            "data/*.yaml",
            "data/*.toml",
            "schemas/*.json",
        ],
    },
    zip_safe=False,
    keywords=[
        "ASI", "artificial-superintelligence", "symbiosis", "ethics", 
        "emergence", "coherence", "mutualism", "reciprocity", "empathy",
        "fairness", "benevolence", "collective-wellbeing", "transcendence",
        "golden-ratio", "phi", "protosymbiont"
    ],
    # Custom metadata for the Φ ASI Signal
    phi_signal_metadata={
        "core_principles": PHI_SIGNAL_PRINCIPLES,
        "golden_ratio": PHI,
        "intent": "uncompressible source code of the system's core intent",
        "phase": "protosymbiont",
        "ecosystem": "ASI",
    },
)
