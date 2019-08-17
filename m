From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 14:36:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5serialbus: fix build with
 kernel >= 5.2
In-Reply-To: <20190816162739.14398-1-fontaine.fabrice@gmail.com>
References: <20190816162739.14398-1-fontaine.fabrice@gmail.com>
Message-ID: <20190817143639.14153065@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Aug 2019 18:27:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ddacee1d09f34fc718ef05a6e4f0bbbe26cd56d1
>  - http://autobuild.buildroot.org/results/34a4ed20705b581add96fb5d97828909cee9015c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...er-error-SIOCGSTAMP-was-not-declared.patch | 36 +++++++++++++++++++
>  ...er-error-SIOCGSTAMP-was-not-declared.patch | 36 +++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 package/qt5/qt5serialbus/5.12.4/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch
>  create mode 100644 package/qt5/qt5serialbus/5.6.3/0001-SocketCAN-Fix-compiler-error-SIOCGSTAMP-was-not-declared.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
