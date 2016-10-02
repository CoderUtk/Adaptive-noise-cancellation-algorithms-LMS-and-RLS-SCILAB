# Adaptive-noise-cancellation-algorithms-LMS-and-RLS-
Least Mean Squares (LMS) and Recursive Least Squares (RLS) algorithm for adaptive noise cancellation.


LMS: This method uses two inputs - primary and reference. The primary input receives signal from the signal source which has been corrupted with a noise uncorrelated to the signal. The reference input receives noise signal uncorrelated with the signal but correlated in some way to the noise signal in primary input. The reference input is adaptively filtered to obtain a close estimate of primary input noise which is then subtracted from the corrupted signal at the primary input to produce an estimate of a clean uncorrupted signal, which is the Adaptive Noise Cancellation output. A desired signal corrupted by noise can be recovered by feeding back this output to Adaptive Filter and implementing Least Mean Square algorithm to minimize output power. The audio signal corrupted with noise is used as a primary input and a noise signal is used as reference input. Computer simulations are carried out using SCILAB and experimental results are presented that illustrate the usefulness of Adaptive Noise Cancelling Technique.


RLS: As various noises seriously affect the quality of our life, the noise cancellation and suppression has been an important
task. After decades of development, the researchers have come up with a variety of effective methods to reduce certain types of
noises. However, the noise presenting in life are basically a mixture of different kinds of noise. This algorithm examines a
phenomenon of periodic noise mixing with impulse noise. In order to cancel or suppress mixed noise, using the method of
spectrogram to detect and eliminate of impulse noise, and then sending the remaining mixed noise into improved RLS adaptive
filtering system to eliminate periodic noise. Through the method described in this paper, SNR can achieve 12dB or more, and the
noise reduction coefficient can reach more than 0.9.
