From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 16:59:19 +0200
Subject: [Buildroot] [PATCH v2] libressl: new package
In-Reply-To: <1413124786-14001-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413124786-14001-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150404165919.3569994e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 12 Oct 2014 16:39:46 +0200, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v1 -> v2:
>     - Add INSTALL_STAGING

It is more complicated than this: libressl installs the same libraries
as openssl. So they should conflict with each other, and possibly a
virtual package should be introduced so that all packages can build
against either libressl or openssl depending on which one is selected.

Since you have pushed again this patch since October 2014, I'll mark
it as Changes Requested in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
