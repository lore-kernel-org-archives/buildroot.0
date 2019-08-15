From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 15:14:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump to
 version 2.4.41
In-Reply-To: <20190815052509.10310-1-bernd.kuhls@t-online.de>
References: <20190815052509.10310-1-bernd.kuhls@t-online.de>
Message-ID: <20190815151410.2f402fb7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 07:25:09 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> http://www.apache.org/dist/httpd/Announcement2.4.html
> http://www.apache.org/dist/httpd/CHANGES_2.4.41
> 
> Fixes
> CVE-2019-10081
> CVE-2019-9517
> CVE-2019-10098
> CVE-2019-10092
> CVE-2019-10097
> CVE-2019-10082
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apache/apache.hash | 4 ++--
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
