library(aws.polly)
library(tuneR)
library(dplyr)
library(readr)
library(stringr)

# https://github.com/cloudyr/aws.polly

# setwd
setwd("C:/Users/Stephen/Desktop/R/AWS/aws_polly")

# set aws account info
# see "aws_account_info.R" file

# synthesize some text
list_voices()

audio <- synthesize("Hello world!", voice = "Joanna")
audio

# play audio
play(audio)


##############################################


# read in ft txt
list.files()
ft_text <- c("The Trump administration has unveiled its toughest sanctions against Russia to date, announcing highly punitive measures against seven high-profile Russian businessmen, a dozen of their companies and 17 senior government officials.
        The sanctions revealed on Friday — days after the Kremlin said Donald Trump had invited Vladimir Putin to the White House — marked a sharp escalation in Washington’s crackdown on Russia.
They targeted prominent oligarchs, headed by aluminium tycoon Oleg Deripaska, whose London-listed holding company EN+ plunged 20 per cent in value on the news. Shares in Rusal, his aluminium producer, fell by as much as 12 per cent on the Moscow exchange.
Other individuals targeted included Viktor Vekselberg, Suleiman Kerimov and Kirill Shamalov, whom the US identified as the husband of one of Vladimir Putin’s daughters.
Additionally, the administration targeted 17 Russian officials working for either the government or state-owned companies. Among those were Alexei Miller, chairman of Gazprom, and Andrei Kostin, head of state-owned VTB.
Mr Deripaska has come under scrutiny by US investigators for his business dealings with Mr Trump’s former campaign manager Paul Manafort, who has been indicted by the US special counsel investigating Russian meddling in the 2016 presidential campaign. 
Mr Vekselberg attended Mr Trump’s January 2017 inauguration.")
glimpse(ft_text)
ft_text

# synthesize voice
list_voices()

audio <- synthesize(text = ft_text, voice = "Salli")
audio

# play audio
play(audio)
str(audio)

# save audio
writeWave(object = audio, filename = "ft_audio.wav")
writeWave(object = audio, filename = "ft_audio.mp3")

# read audio
new_audio_wave <- readWave("ft_audio.wav")
play(new_audio_wave)

# reading mp3 doesn't work for some reason - it comes out garbled
# new_audio_mp3 <- readMP3("ft_audio.mp3")
# play(new_audio_mp3)


