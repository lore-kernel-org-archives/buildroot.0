From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:14:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/ecryptfs-utils: bump version to
 109
In-Reply-To: <1453651107-26352-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453651107-26352-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125231446.136fbc44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 16:58:26 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ecryptfs-utils/ecryptfs-utils.hash | 4 ++--
>  package/ecryptfs-utils/ecryptfs-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied. Please submit the patch in PATCH 2/2 to the upstream
project. It is really important that as many as those musl fixes flow
into the upstream projects, as we don't want to keep hundreds of
patches in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
