From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 07:59:53 +0200
Subject: [Buildroot] [git commit] syslinux: use Git formatted patches
In-Reply-To: <20170406034541.j2zpz6fh44caxzdk@tarshish>
References: <20170405200646.B7843826F9@busybox.osuosl.org>
 <20170406034541.j2zpz6fh44caxzdk@tarshish>
Message-ID: <20170406075953.494202c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Apr 2017 06:45:41 +0300, Baruch Siach wrote:

> On Wed, Apr 05, 2017 at 10:06:06PM +0200, Thomas Petazzoni wrote:
> > commit: https://git.buildroot.net/buildroot/commit/?id=34da6a65adae8463149a28c560926f3349142c2a
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> > 
> > In preparation for the addition of more patches to the syslinux
> > package, reformat the two existing patches as proper Git formatted
> > patches.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  ...001-bios-Fix-alignment-change-with-gcc-5.patch} | 30 +++++++++++++---------
> >  .../0002-Disable-PIE-to-avoid-FTBFS-on-amd64.patch | 30 ++++++++++++++++++++++
> >  boot/syslinux/0002-disable-pie.patch               | 22 ----------------
> >  3 files changed, 48 insertions(+), 34 deletions(-)  
> 
> There are actually three patches here, the last of which is removed. Is that 
> intentional?

Either I'm missing something or you got confused by the rename
detection of Git.

There were originally two patches, and there are two patches after my
change. For the first patch, the similarity was high enough that Git
detects it as a rename. For the second patch, Git didn't detect it as a
rename so you see the addition of
0002-Disable-PIE-to-avoid-FTBFS-on-amd64.patch and the removal of
0002-disable-pie.patch.

Does that make sense?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
