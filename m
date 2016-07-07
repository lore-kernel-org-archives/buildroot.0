From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 11:49:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump to
 version 2.4.23
In-Reply-To: <1467868080-32365-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467868080-32365-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160707114937.16906c32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 07:08:00 +0200, Bernd Kuhls wrote:
> Fixes CVE-2016-4979:
> TLS/SSL X.509 client certificate auth bypass with HTTP/2
> http://httpd.apache.org/security/vulnerabilities_24.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apache/apache.hash | 4 ++--
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
