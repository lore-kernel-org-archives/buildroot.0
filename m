From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:40:58 +0100
Subject: [Buildroot] [PATCH] omxplayer: bump to version 2ee17b2
In-Reply-To: <20171201172755.9968-1-julius@kriukas.lt>
References: <20171201172755.9968-1-julius@kriukas.lt>
Message-ID: <20171201224058.2a3eebca@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 19:27:55 +0200, Julius Kriukas wrote:
> This patch updates omxplayer package to the latest commit on master as
> of 2017-12-01.
> 
> Latest omxplayer version no longer have partial buildroot support and
> Makefile.include file, but still contains some hardcoded include paths
> that needs to be removed before building.
> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>
> ---
>  .../0001-Makefiles-clean-up-the-cruft.patch        | 67 ----------------------
>  ...-Makefile-to-be-compatible-with-buildroot.patch | 39 +++++++++++++
>  package/omxplayer/omxplayer.hash                   |  4 +-
>  package/omxplayer/omxplayer.mk                     |  9 +--
>  4 files changed, 42 insertions(+), 77 deletions(-)
>  delete mode 100644 package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
>  create mode 100644 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch

Applied to master, thanks. You can submit a follow-up patch adding a
hash for the license file, as suggested by Yann.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
