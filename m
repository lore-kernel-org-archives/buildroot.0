From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Feb 2012 09:16:47 +0100
Subject: [Buildroot] Fwd: qemu with buildroot problems
In-Reply-To: <CA+DALLTFUsZO-avT=bgTvCq=Q8a-mptwKQYqwf_wmCo1DFHM2g@mail.gmail.com>
 (Ali Beddah's message of "Sun, 19 Feb 2012 04:44:05 +0200")
References: <CA+DALLSKohmgnk8rR35xZSHHf4x=Ky=+kw8nceLdCb9+RWw7sQ@mail.gmail.com>
 <CA+DALLQeQzds0s7dmogoBwNND3LAPBSG_AWmXwSM8we2cBOcAg@mail.gmail.com>
 <874nuo4lzt.fsf@macbook.be.48ers.dk>
 <CA+DALLTFUsZO-avT=bgTvCq=Q8a-mptwKQYqwf_wmCo1DFHM2g@mail.gmail.com>
Message-ID: <87linx2a34.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ali" == Ali Beddah <ali.beddah@gmail.com> writes:

Hi,

Please keep buildroot mails on the buildroot list in the future, thanks.

 Ali> my target board is?ARM S3C2440 ARM920t 256MB Nand Flash mini2440?
 Ali> i tried the default config with buildroot and with all ways i got?
 Ali> audio: Unknown audio driver `sdl'
 Ali> audio: Run with -audio-help to list available drivers
 Ali> oss: Could not initialize DAC
 Ali> oss: Failed to open `/dev/dsp'
 Ali> oss: Reason: No such file or directory
 Ali> oss: Could not initialize DAC
 Ali> oss: Failed to open `/dev/dsp'
 Ali> oss: Reason: No such file or directory
 Ali> is there a problem with images?
 Ali> ?thanks for respose

Seems you don't have sdl support in your qemu. What is the exact
commandline you're trying to execute, and on what system?

-- 
Bye, Peter Korsgaard
