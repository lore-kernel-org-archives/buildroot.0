From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:16:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxml2: fix CVE-2020-24977
In-Reply-To: <20200914210644.3473075-1-fontaine.fabrice@gmail.com>
References: <20200914210644.3473075-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919221606.132fca7d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 23:06:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> GNOME project libxml2 v2.9.10 and earlier have a global Buffer Overflow
> vulnerability in xmlEncodeEntitiesInternal at libxml2/entities.c.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...of-bounds-read-with-xmllint--htmlout.patch | 40 +++++++++++++++++++
>  package/libxml2/libxml2.mk                    |  2 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 package/libxml2/0003-Fix-out-of-bounds-read-with-xmllint--htmlout.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
