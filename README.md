Purpose
---------------------

Several fundamental tools in scientfic computing are demonstrated through Conway's game of life.

The IPython notebooks are numbered, and demonstrate basic usage of various tools:

1. tests

	Performance comapison between Cython iteration and NumPy vectorization.
	
2. simulate

	Performs one simulation. Demonstrates basic hdf5 usage.
	
3. simulate_stats

	Many frames are created with matplotlib. The frames are then converted to video with ffmpeg. Population over time is also plotted. The rate of population decay has two phases when initialized in a 50/50 random state. The first phase is approximated as an exponential decay, while the second phase is taken to be a linear decay.
	
4. batch

	Many simulations via the multiprocessing module. Results are sent to an hdf5 file.
	
5. batch_stats

	Plots mean of all trials from the hdf5 file. All trials are overlaid with transparency.
