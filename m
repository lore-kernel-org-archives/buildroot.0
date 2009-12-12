From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Dec 2009 08:55:49 +0100
Subject: [Buildroot] [PATCH 5/6] package: Added libdvdnav package
	(dependency of gst-plugins-bad)
In-Reply-To: <1260584550.9059.18.camel@coalu.atr> (Lionel Landwerlin's message
	of "Sat, 12 Dec 2009 03:22:30 +0100")
References: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
	<1260487878-21126-6-git-send-email-llandwerlin@gmail.com>
	<87ws0ttbau.fsf@macbook.be.48ers.dk>
	<1260584550.9059.18.camel@coalu.atr>
Message-ID: <87skbgtym2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

Hi,

 Lionel> I'm sorry, I removed the AUTORECONF option...
 Lionel> I used to set autoreconf & libtool patching by default on
 Lionel> almost every package I compiled otherwise it broke compilation
 Lionel> with my cross sh4 toolchain.

 Lionel> When rebasing my patchs I removed them all, forgetting this was
 Lionel> usefull for libdvdread & libdvdnav packages...

 Lionel> Please find a corrected patch as attachment.

Committed, thanks.

-- 
Bye, Peter Korsgaard
