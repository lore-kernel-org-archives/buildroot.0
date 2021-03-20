From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:24:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/pulseview: bump to version 0.4.2
In-Reply-To: <20210318063313.3946906-1-fontaine.fabrice@gmail.com>
References: <20210318063313.3946906-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320222411.6de24b82@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Mar 2021 07:33:13 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (already in version)
> - BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS is mandatory since
>   https://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=0466001be51e779b23aaebec1cc9361305c07be9
> 
> https://github.com/sigrokproject/pulseview/blob/pulseview-0.4.2/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...lace-obsolete-deprecated-Qt-methods.patch} |  0
>  ...ar-fix-build-without-libsigrokdecode.patch | 37 -------------------
>  package/pulseview/Config.in                   |  2 +
>  package/pulseview/pulseview.hash              |  2 +-
>  package/pulseview/pulseview.mk                |  4 +-
>  5 files changed, 5 insertions(+), 40 deletions(-)
>  rename package/pulseview/{0002-Replace-obsolete-deprecated-Qt-methods.patch => 0001-Replace-obsolete-deprecated-Qt-methods.patch} (100%)
>  delete mode 100644 package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
