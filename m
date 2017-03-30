From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Mar 2017 22:54:11 +0200
Subject: [Buildroot] [PATCH 01/21] docs/manual: refer to SPDX License
	List
In-Reply-To: <1490881430-10434-2-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-2-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <f50ef04f-f1ef-12b3-47cd-249d56dfafea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-03-17 15:43, Rahul Bedarkar wrote:
> We want to use SPDX short identifier for license string as much as
> possible. So refer to SPDX license list and use SPDX short identifier
> for license strings in documentation.
> 
> Also remove License abbreviations that we have.
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  docs/manual/adding-packages-generic.txt       | 12 ++---
>  docs/manual/adding-packages-kernel-module.txt |  4 +-
>  docs/manual/adding-packages-perl.txt          |  2 +-
>  docs/manual/adding-packages-python.txt        |  2 +-
>  docs/manual/legal-notice.txt                  | 75 ---------------------------
>  5 files changed, 10 insertions(+), 85 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index a08283c..2c47be1 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -22,7 +22,7 @@ system is based on hand-written Makefiles or shell scripts.
>  07: LIBFOO_VERSION = 1.0
>  08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
>  09: LIBFOO_SITE = http://www.foosoftware.org/download
> -10: LIBFOO_LICENSE = GPLv3+
> +10: LIBFOO_LICENSE = GPL-3.0+
>  11: LIBFOO_LICENSE_FILES = COPYING
>  12: LIBFOO_INSTALL_STAGING = YES
>  13: LIBFOO_CONFIG_SCRIPTS = libfoo-config
> @@ -396,8 +396,8 @@ information is (assuming the package name is +libfoo+) :
>  * +LIBFOO_LICENSE+ defines the license (or licenses) under which the package
>    is released.
>    This name will appear in the manifest file produced by +make legal-info+.
> -  If the license appears in xref:legal-info-list-licenses[the following list],
> -  use the same string to make the manifest file uniform.
> +  If the license appears in https://spdx.org/licenses/[SPDX License List],
                                                          ^the

 With this minor thing fixed:
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +  use the SPDX short identifier to make the manifest file uniform.
>    Otherwise, describe the license in a precise and concise way, avoiding
>    ambiguous names such as +BSD+ which actually name a family of licenses.
>    This variable is optional. If it is not defined, +unknown+ will appear in
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
