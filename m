From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 19:30:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: security bump version to
 1.7.4
In-Reply-To: <20190622170251.12521-1-bernd.kuhls@t-online.de>
References: <20190622170251.12521-1-bernd.kuhls@t-online.de>
Message-ID: <20190622193037.3e0273e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 19:02:51 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://wiki.znc.in/ChangeLog/1.7.4
> 
> Fixes CVE-2019-12816:
> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12816
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/znc/znc.hash | 2 +-
>  package/znc/znc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
