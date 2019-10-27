From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 10:45:54 +0100
Subject: [Buildroot] [PATCH 7/9] fs: don't use := when not needed
In-Reply-To: <63b793261a6b4cb97ee9fb0581e7280e5339c50f.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
 <63b793261a6b4cb97ee9fb0581e7280e5339c50f.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <7d5f83ce-0e73-5962-db41-db6dbb7a8992@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/10/2019 10:45, Yann E. MORIN wrote:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  fs/btrfs/btrfs.mk | 2 +-
>  fs/ext2/ext2.mk   | 2 +-
>  fs/f2fs/f2fs.mk   | 2 +-
>  fs/jffs2/jffs2.mk | 4 ++--
>  fs/tar/tar.mk     | 2 +-
>  fs/ubi/ubi.mk     | 2 +-

 We normally want one patch per package :-)

 I didn't bother splitting those though.

 Regards,
 Arnout
