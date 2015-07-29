From: Matthew Starr <mstarr@hedonline.com>
Date: Wed, 29 Jul 2015 08:22:57 -0500
Subject: [Buildroot] Using buildroot generated toolchain as external
	toolchain issues
In-Reply-To: <20150729090036.65757161@free-electrons.com>
References: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local><1526636.mbSdBIvjiD@sagittea>
 <20150729090036.65757161@free-electrons.com>
Message-ID: <64CA5C49A43E314D9F7DAE05370E2F7B06771148@hed-dc01.hed.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Wednesday, July 29, 2015 2:01 AM
> 
> Matthew, there are two options currently available to fix this problem:
> 
>  * Use Samuel Martin's patches that adjust the RPATH of host binaries
>    automatically at the end of the build:
> 
>    http://lists.busybox.net/pipermail/buildroot/2015-July/132483.html
>    and following patches.
> 
>  * Use a quick hack that consists in building the libraries needed by
>    gcc as static libraries. This is the trick I'm currently using to
>    build the Buildroot external toolchains used in the autobuilders
>    (http://autobuild.buildroot.org). I can provide the patch if you
>    want.

Could you send out the patch for the static libraries option.    This sounds
like the solution that would be the least likely to cause issues if updating
to a future version of buildroot.

If the static library option is used, how would I go about deploying the
toolchain to the other instances of buildroot that I use?

Best regards,
 
Matthew Starr
