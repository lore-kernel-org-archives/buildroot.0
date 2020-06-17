From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 21:08:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump version to
 3.0.11
In-Reply-To: <20200617175410.1172563-1-bernd.kuhls@t-online.de>
References: <20200617175410.1172563-1-bernd.kuhls@t-online.de>
Message-ID: <20200617210857.4c67a4ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jun 2020 19:54:10 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2020-13428: https://www.videolan.org/security/sb-vlc3011.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc.hash | 12 ++++++------
>  package/vlc/vlc.mk   |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
