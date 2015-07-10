From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 19:35:08 +0200
Subject: [Buildroot] [PATCH 08/16] package/e2fsprogs: make /sbin/fsck
 available
In-Reply-To: <1421684056-5266-9-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-9-git-send-email-maxtram95@gmail.com>
Message-ID: <20150710193508.68c31691@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:08 +0200, Maxim Mikityanskiy wrote:
> systemd looks for fsck in /sbin, so make symlink:
> /sbin/fsck -> /usr/sbin/fsck
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
