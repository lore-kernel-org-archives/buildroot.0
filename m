From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 26 Jul 2008 09:28:20 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
References: <20080723103550.70E8B3C7D7@busybox.net><20080723134217.GC27147@cloud.net.au>
	<20080723142318.GA27902@mx.loc>
Message-ID: <C7AE0FB127ED41699C433B5F47164972@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Wed, Jul 23, 2008 at 11:42:17PM +1000, Hamish Moffatt wrote:
>>On Wed, Jul 23, 2008 at 03:35:50AM -0700, jacmet at uclibc.org wrote:
>
>>Personally I think the shared build_$(ARCH) is just wrong with multiple
>>projects. I might hack my local copy to define BUILD_DIR to match
>>PROJECT_BUILD_DIR to fix this.
>
> The project thing as it is now should not have been applied in the first
> place. It's misguided and not thought through, let alone implemented
> properly. Nothing new. Dead horse.

The project "thing" will allow you to experiment with different kernels,
using a single toolchain
You can select to include or not include a package, but if you
use the package, it has to have the same options in each project.

Patches that will move packages with buildroot options to 
project_build_$(ARCH)
will of course improve the functionality.

If you do not like the project feature, you can always use separate
buildroot trees.

Best Regards
Ulf Samuelsson
