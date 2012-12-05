From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 09:46:50 -0800
Subject: [Buildroot] [PATCH] add support for Freescale .sb format to
	uboot
In-Reply-To: <20121205181613.380b6492c8cfedefafae9655@kinali.ch> (Attila
 Kinali's message of "Wed, 5 Dec 2012 18:16:13 +0100")
References: <CAEnpE0yzcer9dNew-6yfwmjf+L+a=Kgrf-tZ++Y2gMRcwmGYLw@mail.gmail.com>
 <20121205180533.71706c56@skate>
 <20121205181613.380b6492c8cfedefafae9655@kinali.ch>
Message-ID: <87k3sw9yt1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Attila" == Attila Kinali <attila@kinali.ch> writes:

 >> [Buildroot] [PATCH 2/2] u-boot: add support for u-boot.sb file format
 >> 
 >> It was more complete than this one, because it included the dependency
 >> on host-elftosb, which is needed to bring the elftosb tool built by
 >> Buildroot before U-Boot uses it to generate the .sb image.

 Attila> Any reason why it has not gotten into the git repo?

Not really. I don't have any imx hw here. Are you able to test it?

-- 
Bye, Peter Korsgaard
