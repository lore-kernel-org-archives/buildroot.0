From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:45:25 +0200
Subject: [Buildroot] [PATCH] package/samba4: security bump to version
 4.9.8
In-Reply-To: <20190514114205.10515-1-peter@korsgaard.com>
References: <20190514114205.10515-1-peter@korsgaard.com>
Message-ID: <20190514174525.5324d867@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 May 2019 13:42:05 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> CVE-2018-16860: The checksum validation in the S4U2Self handler in the
> embedded Heimdal KDC did not first confirm that the checksum was keyed,
> allowing replacement of the requested target (client) principal.
> 
> For more details, see the advisory:
> https://www.samba.org/samba/security/CVE-2018-16860.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
