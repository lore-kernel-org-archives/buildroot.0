From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 12 Aug 2009 12:36:26 +0200
Subject: [Buildroot] [Bug 563] compiling Linux 2.30.2 for ARM with Atmel
 support
In-Reply-To: <20090812102642.A5E7A77818@busybox.osuosl.org>
References: <bug-563-163@https.bugs.busybox.net/>
	<20090812102642.A5E7A77818@busybox.osuosl.org>
Message-ID: <4A829B2A.3020901@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bugzilla at busybox.net skrev:
> https://bugs.busybox.net/show_bug.cgi?id=563
> 
> 
> 
> 
> 
> --- Comment #3 from Olivier Duclos <oduclos@mandriva.com>  2009-08-12 10:26:41 UTC ---
> Thanks. Will the content of this it repo be included in the next stable release
> ?
> 
> If you ask, I think buildroot should at least print an error message when
> detecting such incompatibilities.
> 
> I've been waisting a lot of time these past few days trying to generate an
> image as I want, but there are so much of bugs and incompatibilities !
> 
> 
You can apply any patchset you want, the config is just an easy short cut.

When you try to build a non-working patch, you will get your error
message during the patch process.

You should expect the patch to work for the kernel version it was
designed for.

You do have the freedom to test the patch on a later kernel, and
for a range of kernels it will work, but don't expect a patchset
to work for all future versions.

If you want to use a patchset, on a later kernel than what is supported,
then you have to manually adapt the patches to your desired kernel
and then use the custom patch feature.


BR
Ulf Samuelsson
