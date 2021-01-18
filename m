From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:24:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/boa: drop package
In-Reply-To: <20210117215413.491117-1-fontaine.fabrice@gmail.com>
References: <20210117215413.491117-1-fontaine.fabrice@gmail.com>
Message-ID: <20210118222450.351e1b0b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 22:54:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop boa package as it is affected by multiple CVEs (CVE-2017-9833,
> CVE-2018-21027 and CVE-2018-21028) and is not maintained anymore (no
> release since 2005):
> 
> https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:boa:boa:0.94.14.21:*:*:*:*:*:*:*
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy                    |   7 +
>  package/Config.in                   |   1 -
>  package/boa/0001-use-name-max.patch |  21 ---
>  package/boa/Config.in               |   8 --
>  package/boa/boa.conf                | 187 -------------------------
>  package/boa/boa.hash                |   3 -
>  package/boa/boa.mk                  |  19 ---
>  package/boa/mime.types              | 205 ----------------------------
>  8 files changed, 7 insertions(+), 444 deletions(-)
>  delete mode 100644 package/boa/0001-use-name-max.patch
>  delete mode 100644 package/boa/Config.in
>  delete mode 100644 package/boa/boa.conf
>  delete mode 100644 package/boa/boa.hash
>  delete mode 100644 package/boa/boa.mk
>  delete mode 100644 package/boa/mime.types

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
