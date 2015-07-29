From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 15:30:34 +0200
Subject: [Buildroot] Using buildroot generated toolchain as external
 toolchain issues
In-Reply-To: <64CA5C49A43E314D9F7DAE05370E2F7B06771148@hed-dc01.hed.local>
References: <64CA5C49A43E314D9F7DAE05370E2F7B06771147@hed-dc01.hed.local>
 <1526636.mbSdBIvjiD@sagittea>
 <20150729090036.65757161@free-electrons.com>
 <64CA5C49A43E314D9F7DAE05370E2F7B06771148@hed-dc01.hed.local>
Message-ID: <20150729153034.514e8764@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jul 2015 08:22:57 -0500, Matthew Starr wrote:

> Could you send out the patch for the static libraries option.    This sounds
> like the solution that would be the least likely to cause issues if updating
> to a future version of buildroot.

Attached.

> If the static library option is used, how would I go about deploying the
> toolchain to the other instances of buildroot that I use?

Just tarball the toolchain (i.e, output/host/), put the tarball
somewhere, and tell your other Buildroot instances to use it as an
external toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-mpc-mpfr-gmp-build-statically-for-the-host.patch
Type: text/x-patch
Size: 1599 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150729/fdaa4113/attachment.bin>
