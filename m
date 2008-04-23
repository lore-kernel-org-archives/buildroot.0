From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 23 Apr 2008 19:35:57 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <010901c8a560$2493f960$020514ac@atmel.com>
References: <20080423145238.B61043C759@busybox.net>
	<d6cda7730804230759w3814c841iba5a7255ddf6a734@mail.gmail.com>
	<010901c8a560$2493f960$020514ac@atmel.com>
Message-ID: <20080423173556.GC10167@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 23, 2008 at 06:22:46PM +0200, Ulf Samuelsson wrote:
>
>> Hmmm I have never seen patch.$ARCH in buildroot.
>> 
>> It's usually -$ARCH.patch like toolchain/kernel-headers
>> package/qtopia4 and others.
>
>
>If you patch with "*.patch",  then *all* architecture dependent patches will be applied
>if you use "-$ARCH.patch"
>
>You want to apply 
>* architecture independent patches
>* architecture dependent patches pertaining to your architecture.
>
>so ".patch.$ARCH" is much cleaner

The concept of per-arch patches is broken per se. You're better off to
fix or drop the dysfunctional patches.
