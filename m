From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:50:31 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to version 2.7.0
In-Reply-To: <20180705205439.29256-1-romain.naour@gmail.com>
References: <20180705205439.29256-1-romain.naour@gmail.com>
Message-ID: <1d799cfd-e8bd-210a-9bc5-d3c235d27e86@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-18 22:54, Romain Naour wrote:
> See http://openpowerlink.sourceforge.net/doc/2.7/2.7.0/page_revision_history.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/openpowerlink/openpowerlink.hash | 8 ++++----
>  package/openpowerlink/openpowerlink.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
> index f69950ddcf..da9bdd2a72 100644
> --- a/package/openpowerlink/openpowerlink.hash
> +++ b/package/openpowerlink/openpowerlink.hash
> @@ -1,5 +1,5 @@
> -# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.6.2/
> -md5	bbb268e33e55424de563cb677703d8f7	openPOWERLINK_V2.6.2.tar.gz
> -sha1	bf6a8b202c1192b531ce6d6c4c6254e5689c65fe	openPOWERLINK_V2.6.2.tar.gz
> +# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.7.0/
> +md5	4843f857b8334c984827435fa9e1ab96	openPOWERLINK_V2.7.0.tar.gz
> +sha1	a256e05d187b334651764ab21a827b3a4fa64e2f	openPOWERLINK_V2.7.0.tar.gz
>  # sha256 locally computed
> -sha256	38d7a93c05cc0167be5c498e625d1efddeac2616ceb1bc8c3c6679552ae6da15	openPOWERLINK_V2.6.2.tar.gz
> +sha256	64c23ee42e3852bf2316fd99c59eae9cdd634219f92b3ea70ce747dad1e05354	openPOWERLINK_V2.7.0.tar.gz

 Perhaps you could also add a license hash?

 Applied to master, thanks.

 Regards,
 Arnout

> diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
> index e2958b30b1..90088cef56 100644
> --- a/package/openpowerlink/openpowerlink.mk
> +++ b/package/openpowerlink/openpowerlink.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENPOWERLINK_VERSION = V2.6.2
> +OPENPOWERLINK_VERSION = V2.7.0
>  OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
>  OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
>  OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
