From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 15:53:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/imagemagick: change download
 url to github
In-Reply-To: <20170618074538.1237-1-bernd.kuhls@t-online.de>
References: <20170618074538.1237-1-bernd.kuhls@t-online.de>
Message-ID: <20170618155338.27b70522@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 09:45:37 +0200, Bernd Kuhls wrote:
> Upstream quickly removes old versions from
> http://www.imagemagick.org/download/releases
> 
> For our LTS versions we should switch to a stable upstream repo which
> provides all released versions.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/imagemagick/imagemagick.hash | 4 ++--
>  package/imagemagick/imagemagick.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
