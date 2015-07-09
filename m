From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 22:05:00 +0200
Subject: [Buildroot] [PATCH] pure-ftpd: add patch that fixes build if
 HAVE_EXPLICIT_BZERO is defined
In-Reply-To: <1436435126-3620-1-git-send-email-abrodkin@synopsys.com>
References: <1436435126-3620-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150709220500.4593b006@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu,  9 Jul 2015 12:45:26 +0300, Alexey Brodkin wrote:
> This patch was already merged upstream and once bumping version of that
> package this patch must be removed.
> 
> See this change upstream:
> https://github.com/jedisct1/pure-ftpd/commit/2d34799585dc65c8c314a2f09a281874dd9b3d55
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...x-building-in-case-of-HAVE_EXPLICIT_BZERO.patch | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/pure-ftpd/0002-Fix-building-in-case-of-HAVE_EXPLICIT_BZERO.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
