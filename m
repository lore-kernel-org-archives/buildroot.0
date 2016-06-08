From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Jun 2016 06:03:04 +0300
Subject: [Buildroot] [PATCH v2 1/1] babeld: new package
In-Reply-To: <1465331732-8421-1-git-send-email-christian@paral.in>
References: <1465331732-8421-1-git-send-email-christian@paral.in>
Message-ID: <20160608030304.GK2425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Tue, Jun 07, 2016 at 01:35:32PM -0700, Christian Stewart wrote:
> +BABELD_VERSION = 1.7.1
> +BABELD_SITE = https://www.irif.univ-paris-diderot.fr/~jch/software/files
> +BABELD_SOURCE = babeld-$(BABELD_VERSION).tar.gz
> +BABELD_LICENSE = as-is

As I noted on your previous patch, this should be 'MIT'.

> +BABELD_LICENSE_FILES = LICENSE

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
