From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:38:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix CallStranger
 a.k.a. CVE-2020-12675
In-Reply-To: <20200906100938.2687269-1-fontaine.fabrice@gmail.com>
References: <20200906100938.2687269-1-fontaine.fabrice@gmail.com>
Message-ID: <20200906143825.09cf208f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Sep 2020 12:09:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> No MINIDLNA_IGNORE_CVES entry is added as no CVE has been assigned to
> minidlna. Indeed, CallStranger vulnerability affect(ed) most of the UPnP
> stacks (e.g. gupnp, libupnp)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-CallStranger-a.k.a.-CVE-2020-12695.patch | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 package/minidlna/0002-upnphttp.c-fix-CallStranger-a.k.a.-CVE-2020-12695.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
