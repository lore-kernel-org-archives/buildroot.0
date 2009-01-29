From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 15:33:08 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
References: <20090126201708.B4FD677458@busybox.osuosl.org><871vup6c9o.fsf@macbook.be.48ers.dk><1233005042.2298.111.camel@elrond.atmel.com><8763k14uz6.fsf@macbook.be.48ers.dk><1233005720.2298.125.camel@elrond.atmel.com>
	<20090127125650.GA18250@cloud.net.au>
Message-ID: <D4FF4B0197F54EE4BC14E179A2F17F15@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The current logic of trying xconfig then menuconfig is very ugly - does
> it allow you to abort xconfig without falling back?

If you could abort the xconfig without running menuconfig,
then you would not have a config file and the build would abort.
What is the sense of that?


Best Regards
Ulf Samuelsson
