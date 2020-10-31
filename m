From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 16:11:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.11.15
In-Reply-To: <20201029214313.1570859-1-bernd.kuhls@t-online.de>
References: <20201029214313.1570859-1-bernd.kuhls@t-online.de>
Message-ID: <20201031161111.1e2ba9d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Oct 2020 22:43:13 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> o CVE-2020-14318: Missing handle permissions check in SMB1/2/3 ChangeNotify.
> o CVE-2020-14323: Unprivileged user can crash winbind.
> o CVE-2020-14383: An authenticated user can crash the DCE/RPC DNS with easily
>                   crafted records.
> 
> Release notes:
> https://www.samba.org/samba/history/samba-4.11.14.html (bugfix-only)
> https://www.samba.org/samba/history/samba-4.11.15.html
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
