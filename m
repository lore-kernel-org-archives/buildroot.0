From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:07:21 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3
	with symlink
In-Reply-To: <87shy9pyhb.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 25 Apr 2016 16:14:08 +0200")
References: <1461442370-22393-1-git-send-email-ubaldo@eja.it>
 <871t5triwb.fsf@dell.be.48ers.dk>
 <81b71ac5323b1793405c3192b6ac5264@eja.it>
 <87shy9pyhb.fsf@dell.be.48ers.dk>
Message-ID: <87k2jlpkwm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> I just tested the new kernel version but it doesn't give me the login
 >> prompt, the kernel seems to be booting fine as it can recognize my
 >> keyboard but it doesn't accept any input.

 > Hmm, odd. I do have a rpi1 at home. I'll try the 4.4 kernel on that one.

On the rpi1 everything works correctly. /dev/console refers to the
serial port and I can login both on HDMI and serial - So I guess the
problem must be specific to the rpi3.

-- 
Bye, Peter Korsgaard
