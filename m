From: hartleys <hartleys@visionengravers.com>
Date: Tue, 19 Aug 2008 19:45:21 -0400
Subject: [Buildroot] Patch files with Makefile.autotools.in
In-Reply-To: <20080819075608.54c5d9c7@atmel.com>
References: <BD79186B4FD85F4B8E60E381CAEE19096D931D@mi8nycmail19.Mi8.com>
	<20080819075608.54c5d9c7@atmel.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19096D9982@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Monday, August 18, 2008 10:56 PM, Hans-Christian Egtvedt wrote:
>> Does anything have to be added to a FOO.mk file to get patches in the

>> FOO directory applied?
>> 
>
> No, but the patch name should preferably be on the form:
> <package name>-<version>-<something descriptive>.patch {.gz,.bz2}
>
> See the stamp_patched rule in package/Makefile.autotools.in

Well, that's how I have it setup but the patch does not get applied.

I see the "Patching $($(PKG)_DIR_PREFIX)/$($PKG)_NAME)" message but when
I examine the source the patch is not present.

I think the problem is related to the FIXME note above the rule. I'm
trying to apply a patch to a package that is not supplied in buildroot.
To keep it separate I have the package in package/customize/<package
name>.

Any ideas on how to fix the FIXME?

Thanks for the reply,
Hartley
