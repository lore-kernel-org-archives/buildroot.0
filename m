From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 21:51:47 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/python-jedi: bump to version 0.17.0
In-Reply-To: <20200502172030.3319707-1-fontaine.fabrice@gmail.com>
References: <20200502172030.3319707-1-fontaine.fabrice@gmail.com>
Message-ID: <20200502195147.GS15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-02 19:20 +0200, Fabrice Fontaine spake thusly:
> Drop flask license as the old flask theme has been replaced with the
> sphinx_rtd_theme since version 0.17.0 and
> https://github.com/davidhalter/jedi/commit/8f96cbdabff671325a2987eb23ba91de90381c15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Fix license
> 
>  package/python-jedi/python-jedi.hash | 5 ++---
>  package/python-jedi/python-jedi.mk   | 9 ++++-----
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
> index 77af6e79f3..ac5f82e1de 100644
> --- a/package/python-jedi/python-jedi.hash
> +++ b/package/python-jedi/python-jedi.hash
> @@ -1,7 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/jedi/json
> -md5  ba88266caac41988ffb4fd6041a3c354  jedi-0.15.1.tar.gz
> -sha256  ba859c74fa3c966a22f2aeebe1b74ee27e2a462f56d3f5f7ca4a59af61bfe42e  jedi-0.15.1.tar.gz
> +md5  d6a8e5832939c51dceda474b720696f6  jedi-0.17.0.tar.gz
> +sha256  df40c97641cb943661d2db4c33c2e1ff75d491189423249e989bcea4464f3030  jedi-0.17.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
> -sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
>  sha256  b41b78f562a2e65b75cab44354335f6f435d4ef73065509600ac910cf4e22fe0  jedi/third_party/typeshed/LICENSE
> diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
> index 4e756a709c..245ba99a3c 100644
> --- a/package/python-jedi/python-jedi.mk
> +++ b/package/python-jedi/python-jedi.mk
> @@ -4,12 +4,11 @@
>  #
>  ################################################################################
>  
> -PYTHON_JEDI_VERSION = 0.15.1
> +PYTHON_JEDI_VERSION = 0.17.0
>  PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
> -PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/85/03/cd5a6e44a5753b4d539288d9d1f9645caac889c17dd2950292a8818f86b2
> +PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/e3/5b/65ff9c102d92bf719dfaeff57bc8074d68f26ea480005704a956da995799
>  PYTHON_JEDI_SETUP_TYPE = setuptools
> -PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme), Apache-2.0 (typeshed)
> -PYTHON_JEDI_LICENSE_FILES = \
> -	LICENSE.txt docs/_themes/flask/LICENSE jedi/third_party/typeshed/LICENSE
> +PYTHON_JEDI_LICENSE = MIT, Apache-2.0 (typeshed)
> +PYTHON_JEDI_LICENSE_FILES = LICENSE.txt jedi/third_party/typeshed/LICENSE
>  
>  $(eval $(python-package))
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
