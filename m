From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Thu, 20 May 2021 21:04:52 +0000
Subject: [Buildroot] [External] [PATCH/NEXT: 01/11] package/libsepol:
 bump to version 3.2
In-Reply-To: <DM2P110MB0105ED98FD4B279E2894DA12F22A9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
References: <20210520174649.1188340-1-aduskett@gmail.com>,
 <20210520174649.1188340-2-aduskett@gmail.com>,
 <DM2P110MB0105ED98FD4B279E2894DA12F22A9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
Message-ID: <DM2P110MB0105B7812C5988186E328BEDF22A9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

> From: buildroot <buildroot-bounces@busybox.net> on behalf of Weber, Matthew L Collins via buildroot <buildroot@busybox.net>
> Sent: Thursday, May 20, 2021 3:02 PM
> To: Adam Duskett <aduskett@gmail.com>; buildroot at buildroot.org <buildroot@buildroot.org>
> Cc: Antoine Tenart <atenart@kernel.org>; Shotwell, Clayton L Collins <Clayton.Shotwell@collins.com>; Marcus Folkesson <marcus.folkesson@gmail.com>
> Subject: Re: [Buildroot] [External] [PATCH/NEXT: 01/11] package/libsepol: bump to version 3.2
> ?
> Adam,
>
> > From: Adam Duskett <aduskett@gmail.com>
> > Sent: Thursday, May 20, 2021 12:46 PM
> > To: buildroot at buildroot.org <buildroot@buildroot.org>
> > Cc: Antoine Tenart <atenart@kernel.org>; Shotwell, Clayton L Collins <Clayton.Shotwell@collins.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>; Marcus Folkesson <marcus.folkesson@gmail.com>; Adam Duskett <aduskett@gmail.com>
> > Subject: [External] [PATCH/NEXT: 01/11] package/libsepol: bump to version 3.2
> > ?
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
> I applied this series against NEXT and ran the following:
> ? ./support/testing/run-tests? tests.core.test_selinux.TestSELinuxPackage
>
> However, it failed.?

So it turns out my test run didn't have a good rng and it failed for timeout reasons.  I did some adjustments and the tests now pass for all 4 runtest use cases.

16:00:56 TestSELinuxExtraModulesDirs              Starting
16:00:56 TestSELinuxExtraModules                  Starting
16:01:43 TestSELinuxExtraModulesDirs              Cleaning up
.16:01:43 TestSELinuxCustomGit                     Starting
16:01:43 TestSELinuxCustomGit                     Cleaning up
.16:01:43 TestSELinuxPackage                       Starting
16:01:50 TestSELinuxExtraModules                  Cleaning up
.16:03:07 TestSELinuxPackage                       Cleaning up
.
----------------------------------------------------------------------
Ran 4 tests in 131.377s

OK

      1 776f05a270 (HEAD) package/audit: bump to version 3.0.1
      2 3551c17333 package/setools: bump to version 4.4.0
      3 6fffc6cc35 package/selinux-python: bump to version 3.2
      4 581eb0e524 package/semodule-utils: bump to version 3.2
      5 7671336b99 package/restorecond: bump to version 3.2
      6 c0a9412021 package/checkpolicy: bump to version 3.2
      7 0450bd2b6f package/policycoreutils: bump to version 3.2
      8 0ee7f07bfc package/libselinux: bump to version 3.2
      9 e79fc41939 package/libsemanage: bump to version 3.2
     10 29ee5a71f1 package/libsepol/Config.in: Add policy version 33
     11 419acd7f43 package/libsepol: bump to version 3.2
     12 abc110e362 (refs/remotes/upstream/next, refs/remotes/origin/next) package/gobject-introspection: bump to version 1.68.0

Tested-by: Matthew Weber <matthew.weber@collins.com>
