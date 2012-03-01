From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 10:28:43 +0100
Subject: [Buildroot] Added package for RxTx Library
In-Reply-To: <33414226.post@talk.nabble.com>
References: <33414226.post@talk.nabble.com>
Message-ID: <20120301102843.6c283b44@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 1 Mar 2012 00:47:05 -0800 (PST),
JennyM <jenny.murphy@episensor.com> a ?crit :

>  I am new to buildroot and am using it to develop a cross compilation
> toochain and filesystem for an embedded ARM9/Linux platform.
> I have jamvm already running some java applications on the embedded
> platform. However I would like to use SerialRxTx from my java code. I
> tried some of the already prepared .so files from the RXTX download
> site and they are not working so I am coming to the conclusion that
> it necessary for me to compile my own.
> So from your message below it seems like you may have made this step
> easier for me. What is the current status of the patch? Can I use it
> and what is the process for patching my current version of buildroot?

The patch has not been merged (I don't remember why), but more
importantly, the Java support in Buildroot has been removed in 2012.02.
Nobody was taking care of it, so we marked it deprecated a few releases
ago, no-one stepped up to maintain it, so it has finally been removed.

If you are interested in bringing the Java/jamvm support in Buildroot
up-to-date, we would definitely be interested by your patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
