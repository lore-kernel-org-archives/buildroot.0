From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Mar 2015 22:59:04 +0100
Subject: [Buildroot] [PATCH v2 3/4] python-markdown: add host-package
	support
In-Reply-To: <1424891914-27748-3-git-send-email-gwenj@trabucayre.com>
References: <1424891914-27748-1-git-send-email-gwenj@trabucayre.com>
 <1424891914-27748-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMJunrf3iz39qzbVemtSiXXPp8L6vNniR-8DbX-31N9KcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

On Wed, Feb 25, 2015 at 8:18 PM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> Host-cheetah needs host-markdown.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/python-markdown/python-markdown.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
> index 864825e..3b2217e 100644
> --- a/package/python-markdown/python-markdown.mk
> +++ b/package/python-markdown/python-markdown.mk
> @@ -12,3 +12,4 @@ PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
>  PYTHON_MARKDOWN_SETUP_TYPE = distutils
>
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.0.5
>

The patch order looks odd... the patch 2/4 uses what is introduced by
the patch 3/4.
It is not a big deal, just a bit confusing at first. ;-)

Regards,

-- 
Samuel
