From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:51:14 +0200
Subject: [Buildroot] [PATCH 1/1] espeak: bump to version 1.48.04
In-Reply-To: <1407237401-22711-1-git-send-email-arnaud@intelibre.fr>
References: <1407237401-22711-1-git-send-email-arnaud@intelibre.fr>
Message-ID: <20140806195114.3f95a2d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud,

On Tue,  5 Aug 2014 13:16:41 +0200, arnaud at intelibre.fr wrote:
> From: Arnaud Aujon <arnaud@intelibre.fr>
> 
> * Bump to latest upstream version 1.48.04
> * Remove patch as applied upstream
> 
> Signed-off-by: Arnaud Aujon <arnaud@intelibre.fr>
> ---
>  package/espeak/espeak-01-do-not-compil-when-install.patch | 15 ---------------
>  package/espeak/espeak.mk                                  |  4 ++--
>  2 files changed, 2 insertions(+), 17 deletions(-)
>  delete mode 100644 package/espeak/espeak-01-do-not-compil-when-install.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
