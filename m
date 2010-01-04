From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jan 2010 14:20:56 +0100
Subject: [Buildroot] [PATCH] Permit building grub with an external
 toolchain.
In-Reply-To: <1262610104.3853.6.camel@venture>
References: <1262472376.23927.19.camel@venture>
	<1262477625.23193.2.camel@coalu.atr>
	<1262484948.23927.25.camel@venture>
	<1262491694.23193.10.camel@coalu.atr>
	<1262526218.23927.27.camel@venture>
	<1262610104.3853.6.camel@venture>
Message-ID: <20100104142056.7ab397fc@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Clark!

Le Mon, 04 Jan 2010 08:01:44 -0500,
Clark Rawlins <clark.rawlins@escient.com> a ?crit :

> Here is my attempt to use the autotools macros.
> I look forward to any discussion, suggestions for improvement etc.
> 
> I attach the whole file since it is effectively a rewrite.  If it is
> acceptable I will submit as a git diff against head.  

Thanks for your work.

Maybe the GRUB_SUPPORTED_ARCH thing should be handled at the
Config.in level.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
