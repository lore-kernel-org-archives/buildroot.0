From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:18:05 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
In-Reply-To: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170301221805.3bb64056@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 23:52:36 +0100, Angelo Compagnucci wrote:
> Currently the buildroot website is not leveraging common
> techniques to have a better loading speed (browser caching,
> gzip compression, deflating).
> This commit provides an .htaccess files with all the needed to
> enable mentioned features. This .htaccess only works if the
> webserver has deflate, expires and headers modules enabled.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/website/.htaccess | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 docs/website/.htaccess

Applied to master, thanks. Let's see if this actually works, and gives
useful improvements :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
