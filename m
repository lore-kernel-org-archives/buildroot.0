From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 12:04:01 +0200
Subject: [Buildroot] [PATCH 2/2] openblas: bump version to v0.2.20
In-Reply-To: <20180401084642.15199-2-peter@korsgaard.com>
References: <20180401084642.15199-1-peter@korsgaard.com>
 <20180401084642.15199-2-peter@korsgaard.com>
Message-ID: <20180401120401.3c0c6cbb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 10:46:42 +0200, Peter Korsgaard wrote:

> +The other flags, such as -mfpu=vfp or -mfloat-abi=hard are kept, as they
> +are actually required for the build to proceed (OpenBLAS uses VFP
> +instructions, and assume an EABIhf ABI).
> +
> +[Peter: update for v0.2.20

This is going to be the most useless e-mail, but here is a minor nit:
missing closing bracket.

I'm just going to add a few more sentences here, just to pretend this
e-mail is not just about this small nit. But I don't have much else to
say about this patch. Oh well, the length of this text starts to justify
this e-mail. I can probably stop here, and put my usual closing Best
regards, so let's do this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
