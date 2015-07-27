From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:56:12 +0200
Subject: [Buildroot] [PATCH v3] transmission: improve systemd support
In-Reply-To: <1437344281-12250-1-git-send-email-aurelien@chabot.fr>
References: <1421684056-5266-11-git-send-email-maxtram95@gmail.com>
 <1437344281-12250-1-git-send-email-aurelien@chabot.fr>
Message-ID: <20150727235612.5fc105ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aur?lien Chabot,

On Mon, 20 Jul 2015 00:18:01 +0200, Aur?lien Chabot wrote:
> From: Maxim Mikityanskiy <maxtram95@gmail.com>
> 
> Support running transmission-daemon in system-wide mode using systemd:
> 
> 1. Pass --with-systemd-daemon to configure script if systemd is enabled.
> 
> 2. Create the transmission user if having daemon
> 
> 3. Install transmission-daemon.service for systemd.
> 
> [Aur?lien : Fix symlink relative path, use upstream service file,
> no need for config path, and use transmission user in sysv script,
> remove sysctl stuff]
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
> ---
>  package/transmission/S92transmission |  4 +---
>  package/transmission/transmission.mk | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
