From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 16:04:04 +0100
Subject: [Buildroot] [PATCH 1/6] python-urwid: bump version and add
	checksums
In-Reply-To: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <55E9B2E4.3050205@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zhristophe Vu-Brugier,

could you please mark this v1 patch series as superseded in patchwork?
Thanks.

Regards,

Vincent.

On 09/01/2015 09:10 AM, Christophe Vu-Brugier wrote:
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/python-urwid/python-urwid.hash | 3 +++
>  package/python-urwid/python-urwid.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/python-urwid/python-urwid.hash
> 
> diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
> new file mode 100644
> index 0000000..2b18082
> --- /dev/null
> +++ b/package/python-urwid/python-urwid.hash
> @@ -0,0 +1,3 @@
> +# md from https://pypi.python.org/pypi?:action=show_md5&digest=a989acd54f4ff1a554add464803a9175, sha256 locally computed
> +md5  	a989acd54f4ff1a554add464803a9175  urwid-1.3.0.tar.gz
> +sha256	29f04fad3bf0a79c5491f7ebec2d50fa086e9d16359896c9204c6a92bc07aba2  urwid-1.3.0.tar.gz
> diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
> index 4f1be46..1cd3022 100644
> --- a/package/python-urwid/python-urwid.mk
> +++ b/package/python-urwid/python-urwid.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_URWID_VERSION = 1.2.1
> +PYTHON_URWID_VERSION = 1.3.0
>  PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
>  PYTHON_URWID_SITE = https://pypi.python.org/packages/source/u/urwid
>  PYTHON_URWID_LICENSE = LGPLv2.1+
> 
