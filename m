From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 23 Apr 2008 18:22:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
References: <20080423145238.B61043C759@busybox.net>
	<d6cda7730804230759w3814c841iba5a7255ddf6a734@mail.gmail.com>
Message-ID: <010901c8a560$2493f960$020514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hmmm I have never seen patch.$ARCH in buildroot.
> 
> It's usually -$ARCH.patch like toolchain/kernel-headers
> package/qtopia4 and others.


If you patch with "*.patch",  then *all* architecture dependent patches will be applied
if you use "-$ARCH.patch"

You want to apply 
* architecture independent patches
* architecture dependent patches pertaining to your architecture.

so ".patch.$ARCH" is much cleaner


Best Regards
Ulf Samuelsson
