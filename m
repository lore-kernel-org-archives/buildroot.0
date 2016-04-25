From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Mon, 25 Apr 2016 15:22:35 +0100
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
	with symlink
In-Reply-To: <87shy9pyhb.fsf@dell.be.48ers.dk>
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk> <81b71ac5323b1793405c3192b6ac5264@eja.it>
 <87shy9pyhb.fsf@dell.be.48ers.dk>
Message-ID: <0e46f942789e78b682343cc6eba07554@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 2016-04-25 15:14 Peter Korsgaard ha scritto:
>>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:
> 
>  > Hi Peter,
>  > Il 2016-04-25 13:07 Peter Korsgaard ha scritto:
>  >>>>>>> "Ubaldo" == Ubaldo Porcheddu <ubaldo@eja.it> writes:
>  >>
>  >> > Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
>  >>
>  >> Committed after expanding the commit message, thanks.
>  >>
>  >> I've also committed a change to sync the kernel version with what 
> is
>  >> used for rpi1/2 (E.G. the rpi-4.4.y branch). Care to verify that
>  >> everything works correctly after that?
> 
>  > I just tested the new kernel version but it doesn't give me the 
> login
>  > prompt, the kernel seems to be booting fine as it can recognize my
>  > keyboard but it doesn't accept any input.
> 
> Hmm, odd. I do have a rpi1 at home. I'll try the 4.4 kernel on that 
> one.
> 
> So do I understand you correctly that you do see the kernel messages on
> the HDMI output but don't get a login prompt / nothing happens when you
> type on your USB keyboard.

yes this is actually what is happening.
