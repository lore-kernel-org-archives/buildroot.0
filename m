From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 May 2018 23:52:27 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com> (Romain Naour's
 message of "Mon, 21 May 2018 17:45:02 +0200")
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
 <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
Message-ID: <87bmd8ismc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 > See the reply from Arnout and Dagg for gcc 4.9:
 > http://patchwork.ozlabs.org/patch/767087

 > I'm not sure that the odroidc2 defconfig is able to build with gcc >= 4.9 since
 > it's stuck at kernel odroidc2-3.14.y and uboot odroidc2-v2015.01.
 > Dagg, what do we do for this board?

I believe that mainline support for this board is fairly far, so if that
is the only thing keeping 4.9 around I think we can drop it.

-- 
Bye, Peter Korsgaard
