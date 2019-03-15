From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:38:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump to
 version 4.9.5
In-Reply-To: <20190315175958.2407-1-bernd.kuhls@t-online.de>
References: <20190315175958.2407-1-bernd.kuhls@t-online.de>
Message-ID: <20190315213802.15e68fca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 18:59:58 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.samba.org/samba/history/samba-4.9.5.html
> 
> Fixes CVE-2019-3824:
> ldb: Out of bound read in ldb_wildcard_compare
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
