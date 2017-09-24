From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 16:15:10 +0200
Subject: [Buildroot] [PATCH] python-lxml: bump to version 4.0.0
In-Reply-To: <1505972426-9056-1-git-send-email-yegorslists@googlemail.com>
References: <1505972426-9056-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <fe2ec37d-837e-b0ff-0bb4-d201b945b4c4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-09-17 07:40, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/python-lxml/python-lxml.hash | 2 +-
>  package/python-lxml/python-lxml.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
> index a1dc093..38607e1 100644
> --- a/package/python-lxml/python-lxml.hash
> +++ b/package/python-lxml/python-lxml.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256  59d9176360dbc3919e9d4bfca85c1ca64ab4f4ee00e6f119d7150ba887e3410a  lxml-3.7.2.tgz
> +sha256  f7bc9f702500e205b1560d620f14015fec76dcd6f9e889a946a2ddcc3c344fd0  lxml-4.0.0.tgz
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> index db6591f..7f1692d 100644
> --- a/package/python-lxml/python-lxml.mk
> +++ b/package/python-lxml/python-lxml.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_LXML_VERSION = 3.7.2
> +PYTHON_LXML_VERSION = 4.0.0
>  PYTHON_LXML_SITE = http://lxml.de/files
>  PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
