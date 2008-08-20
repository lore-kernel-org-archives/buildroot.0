From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 20 Aug 2008 10:03:27 +0200
Subject: [Buildroot] Patch files with Makefile.autotools.in
In-Reply-To: <20080820090529.649c4477@atmel.com>
References: <BD79186B4FD85F4B8E60E381CAEE19096D931D@mi8nycmail19.Mi8.com>
	<20080819075608.54c5d9c7@atmel.com>
	<BD79186B4FD85F4B8E60E381CAEE19096D9982@mi8nycmail19.Mi8.com>
	<20080820090529.649c4477@atmel.com>
Message-ID: <20080820080327.GB19268@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 20, 2008 at 09:05:29AM +0200, Hans-Christian Egtvedt wrote:
>On Tue, 19 Aug 2008 19:45:21 -0400
>"hartleys" <hartleys@visionengravers.com> wrote:
>
>> Monday, August 18, 2008 10:56 PM, Hans-Christian Egtvedt wrote:
>
><snipp problems with patching a custom package>
>
>> I see the "Patching $($(PKG)_DIR_PREFIX)/$($PKG)_NAME)" message but
>> when I examine the source the patch is not present.
>> 
>> I think the problem is related to the FIXME note above the rule. I'm
>> trying to apply a patch to a package that is not supplied in
>> buildroot. To keep it separate I have the package in
>> package/customize/<package
>> name>.
>> 
>
>Yes, you are indeed a victim of the FIXME, since you do not use the
>"standard" package/<package name> directory structure.
>
>> Any ideas on how to fix the FIXME?
>> 
>
>A quick fix would be to just symlink package/customize/<package name>
>to package/<package name>.
>
>I'll do a mental note of the problem, it is likely to show up in the
>future as well.

heh, that was exactly the reason why i added that nice FIXME in the
first place ;)

What secret package is this about anyway? If it's of general use, it
should be added to the tree..
