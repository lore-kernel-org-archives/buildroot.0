From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 21:36:44 +0200
Subject: [Buildroot] [PATCH v2] mongrel2: Add comments to avoid use of
 github call
In-Reply-To: <1413135974-18291-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413135974-18291-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141012213644.197f09b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Oct 2014 19:46:14 +0200, Maxime Hadjinlian wrote:

>  MONGREL2_VERSION = v1.9.1
> +# Do not uses the github helper here, the generated tarball is *NOT* the same

s/uses/use/

> +# as the one uploaded by upstream for the release.
>  MONGREL2_SITE = https://github.com/zedshaw/mongrel2/releases/download/$(MONGREL2_VERSION)
>  MONGREL2_LICENSE = BSD-3c
>  MONGREL2_LICENSE_FILES = LICENSE


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
