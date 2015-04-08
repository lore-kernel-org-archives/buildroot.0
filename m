From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:33:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: Remove unused dependency
 to libungif
In-Reply-To: <1428524507-30375-2-git-send-email-bernd.kuhls@t-online.de>
References: <1428524507-30375-1-git-send-email-bernd.kuhls@t-online.de>
 <1428524507-30375-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150408223335.7622520e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed,  8 Apr 2015 22:21:47 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in |    1 -
>  package/kodi/kodi.mk   |    2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied, thanks!

With this, the latest user of libungif is gone, so can you send a patch
to deprecate the libungif package? I believe it was the overall goal of
moving to giflib, right?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
