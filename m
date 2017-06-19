From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:09:24 +0200
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.3
In-Reply-To: <20170618213502.16233-1-peter@korsgaard.com>
References: <20170618213502.16233-1-peter@korsgaard.com>
Message-ID: <20170619220924.4e13526b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Jun 2017 23:35:02 +0200, Peter Korsgaard wrote:
> Fixes:
> 
> CVE-2017-9468 - Joseph Bisch discovered that Irssi does not properly handle
> DCC messages without source nick/host.  A malicious IRC server can take
> advantage of this flaw to cause Irssi to crash, resulting in a  denial of
> service.
> 
> CVE-2017-9469 - Joseph Bisch discovered that Irssi does not properly handle
> receiving incorrectly quoted DCC files.  A remote attacker can take
> advantage of this flaw to cause Irssi to crash, resulting in a denial of
> service.
> 
> See https://irssi.org/security/irssi_sa_2017_06.txt for more details.
> 
> Remove 0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch as it
> applied upstream and drop autoreconf as configure.ac is no longer patched.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...-to-using-pkg-config-to-check-for-OpenSSL.patch | 77 ----------------------
>  package/irssi/irssi.hash                           |  2 +-
>  package/irssi/irssi.mk                             |  5 +-
>  3 files changed, 2 insertions(+), 82 deletions(-)
>  delete mode 100644 package/irssi/0001-Get-back-to-using-pkg-config-to-check-for-OpenSSL.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
