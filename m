From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Apr 2016 18:53:47 +0200
Subject: [Buildroot] [PATCH 1/1] Raspberry PI 3 kernel,
	firmware and dtb update
In-Reply-To: <87wpnsdaf2.fsf@dell.be.48ers.dk>
References: <1459421492-18815-1-git-send-email-ubaldo@eja.it>
 <87a8kpe39z.fsf@dell.be.48ers.dk> <20160419213321.GG3505@free.fr>
 <87wpnsdaf2.fsf@dell.be.48ers.dk>
Message-ID: <20160423165347.GA3540@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ubaldo, All,

On 2016-04-20 09:08 +0200, Peter Korsgaard spake thusly:
> The rpi3 afaik uses a different serial port than rpi2. How will that
> work if we use the same defconfig for both boards? Perhaps it makes more
> sense to have a seperate raspberrypi3_defconfig?

BTW, the serial port that is available on the 40-pin header on RPi3 is
ttyS0 (I forgot to mention that previously; not sure it was figured out
yet, so better re-hash it just in case).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
