From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:58:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to
 7.0.8
In-Reply-To: <1466894917-32068-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466894917-32068-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160626145815.3bdac10f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 00:48:37 +0200, Bernd Kuhls wrote:
> Changelog is available here: http://php.net/ChangeLog-7.php#7.0.8
> 
> Fixes CVE-2015-8874 http://bugs.php.net/66387
> Fixes CVE-2016-5766 http://bugs.php.net/72339
> Fixes CVE-2016-5767 http://bugs.php.net/72446
> Fixes CVE-2016-5768 http://bugs.php.net/72402
> Fixes CVE-2016-5769 http://bugs.php.net/72455
> Fixes CVE-2016-5772 http://bugs.php.net/72340
> Fixes CVE-2016-5773 http://bugs.php.net/72434
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
