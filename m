From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 23 Apr 2008 20:37:11 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <018c01c8a56d$beab6120$020514ac@atmel.com>
References: <20080423173556.GC10167@mx.loc>
	<018c01c8a56d$beab6120$020514ac@atmel.com>
Message-ID: <20080423183710.GD10167@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 23, 2008 at 07:39:38PM +0200, Ulf Samuelsson wrote:
>
>
>> On Wed, Apr 23, 2008 at 06:22:46PM +0200, Ulf Samuelsson wrote:
>>>
>>>> Hmmm I have never seen patch.$ARCH in buildroot.
>>>> 
>>>> It's usually -$ARCH.patch like toolchain/kernel-headers
>>>> package/qtopia4 and others.
>>>
>>>
>>>If you patch with "*.patch",  then *all* architecture dependent patches will be applied
>>>if you use "-$ARCH.patch"
>>>
>>>You want to apply 
>>>* architecture independent patches
>>>* architecture dependent patches pertaining to your architecture.
>>>
>>>so ".patch.$ARCH" is much cleaner
>> 
>> The concept of per-arch patches is broken per se. You're better off to
>> fix or drop the dysfunctional patches.
>
>
>The per-arch patch is low maintenance, while your idea is high maintenance.

We already had that argument, so let me just repeat that you have to
fixup your port anyway, sooner or later. 'nuff said
