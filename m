From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 7 Apr 2018 08:04:43 -0500
Subject: [Buildroot] [PATCH v2 1/2] cramfs: change to new site location
In-Reply-To: <20180407120701.89259-2-chris.brandt@renesas.com>
References: <20180407120701.89259-1-chris.brandt@renesas.com>
 <20180407120701.89259-2-chris.brandt@renesas.com>
Message-ID: <CANQCQpaeUmq6S44HK4T=Rnosq4SKKb44k-ASVqgeT+KDwdHJKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Sat, Apr 7, 2018 at 7:07 AM, Chris Brandt <chris.brandt@renesas.com> wrote:
> As of Linux-4.15, cramfs now has a official maintainer again.
> Additionally, that person is hosting and maintaining a new version of
> cramfs-tools.
>
> Patches 0001-endian.patch and 0003-fix-missing-types.patch are no longer
> needed because they have been upstreamed.
>
> However, since patch 0002-cygwin_IO.patch is so old, it is being
> removed until someone that needs it can reapply and test it. At
> that point, they should submit the changes to the new cramfs-tools
> maintainer instead of adding the patches back here.
>

You may want to add to this commit message to mention the new upstream
took an action to add endian support to cramfsck but this patchset
actually removes support.

For v1, I've tested a modified version which matches this patchset on
a big endian target.

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
