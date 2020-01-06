From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:29:34 +0100
Subject: [Buildroot] [PATCH] package/libarchive: security bump to
 version 3.4.1
In-Reply-To: <1578340597-31153-1-git-send-email-pjtexier@koncepto.io>
References: <1578340597-31153-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200106232934.470009c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 20:56:37 +0100
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Fixes the following security vulnerabilities:
> 
> - CVE-2019-19221: In Libarchive 3.4.0, archive_wstring_append_from_mbs in archive_string.c
>  has an out-of-bounds read because of an incorrect mbrtowc or mbtowc call. For example,
>  bsdtar crashes via a crafted archive.
> 
> And adds various security fixes.  For details, see :
> 
> https://github.com/libarchive/libarchive/releases/tag/v3.4.1
> 
> Also remove upstreamed patch.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
> v1 -> v2 :
> 	- update commit title "libarchive to package/libarchive"

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
