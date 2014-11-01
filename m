From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:54:05 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/clamav: New package
In-Reply-To: <1414790120-11704-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414790120-11704-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141101155405.4a1c4201@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 31 Oct 2014 22:15:19 +0100, Bernd Kuhls wrote:
> ---
> v4: fixed typo in patch #0002, removed --sysconfdir (Peter)
> v3: CLAMAV_CONF_OPT -> CLAMAV_CONF_OPTS
> v2: - Reworked dependencies (Thomas)
>       - OpenSSL and zlib are mandatory dependencies
>       - iconv is an optional dependency
>       - gettext is an optional dependency (see shared/output.c, line 72)
>     - Added more license files (Thomas)
>     - patch #0002 renamed and submitted upstream (Thomas)
>     - package/Config.in: respect alphabetic ordering (Thomas)
>     - package/clamav/Config.in: moved bool (Thomas)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                               |    1 +
>  package/clamav/Config.in                        |   16 ++++++
>  package/clamav/clamav-0001-clamdscan.patch      |   21 ++++++++
>  package/clamav/clamav-0002-static-linking.patch |   58 ++++++++++++++++++++++
>  package/clamav/clamav.mk                        |   60 +++++++++++++++++++++++
>  5 files changed, 156 insertions(+)
>  create mode 100644 package/clamav/Config.in
>  create mode 100644 package/clamav/clamav-0001-clamdscan.patch
>  create mode 100644 package/clamav/clamav-0002-static-linking.patch
>  create mode 100644 package/clamav/clamav.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
