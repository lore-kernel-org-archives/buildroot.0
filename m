From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Mar 2011 16:42:54 -0500
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/remove-config-scripts
In-Reply-To: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299532965.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201103071642.55380.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, March 07, 2011 16:22:44 Thomas Petazzoni wrote:
> The following changes since commit
> 0a064b48c9d1044b05aee65272f5af7f28879473: Gustavo Zacarias (1):
>         gst-ffmpeg: bump to version 0.10.11
> 
> are available in the git repository at:
> 
>   git://git.busybox.net/~tpetazzoni/git/buildroot
> for-2011.05/remove-config-scripts
> 
> Thomas Petazzoni (6):
>       imagemagick: remove *-config scripts from TARGET_DIR
>       neon: remove neon-config script from TARGET_DIR
>       libdnet: remove dnet-config script from TARGET_DIR
>       libpng: remove libpng*-config scripts from TARGET_DIR
>       libxml2: remove xml2-config script from TARGET_DIR
>       libxslt: remove xslt-config script from TARGET_DIR

told you we should have adopted my one line change to the top level install :p
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110307/d46db732/attachment.asc>
