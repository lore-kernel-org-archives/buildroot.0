From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 21:33:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/ngircd: bump to version 25
In-Reply-To: <20190313181134.2530-1-fontaine.fabrice@gmail.com>
References: <20190313181134.2530-1-fontaine.fabrice@gmail.com>
Message-ID: <20190314213329.24f7e55b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 19:11:34 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ngircd/0001-Fix-Get_error-usage.patch | 44 ---------------------------
>  package/ngircd/ngircd.hash                    |  3 +-
>  package/ngircd/ngircd.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 46 deletions(-)
>  delete mode 100644 package/ngircd/0001-Fix-Get_error-usage.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
