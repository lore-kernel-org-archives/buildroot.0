From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 13:55:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: security bump to version
 1.7.3
In-Reply-To: <20190330174249.30431-1-bernd.kuhls@t-online.de>
References: <20190330174249.30431-1-bernd.kuhls@t-online.de>
Message-ID: <20190331135559.7595cb76@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 18:42:49 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Changelog: https://wiki.znc.in/ChangeLog/1.7.3
> 
> Fixes CVE-2019-9917:
> http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9917
> - ZNC before 1.7.3-rc1 allows an existing remote user to cause a Denial
>   of Service (crash) via invalid encoding.
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
