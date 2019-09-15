From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:23:21 +0200
Subject: [Buildroot] [PATCH] package/expat: security bump to version
 2.2.8
In-Reply-To: <20190915202142.13870-1-peter@korsgaard.com>
References: <20190915202142.13870-1-peter@korsgaard.com>
Message-ID: <20190915222321.6685badd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Sep 2019 22:21:42 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerability:
> 
> CVE-2019-15903: In libexpat before 2.2.8, crafted XML input could fool the
> parser into changing from DTD parsing to document parsing too early; a
> consecutive call to XML_GetCurrentLineNumber (or XML_GetCurrentColumnNumber)
> then resulted in a heap-based buffer over-read.
> 
> While we're at it, also change to use .tar.xz rather than the bigger
> .tar.bz2.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/expat/expat.hash | 8 ++++----
>  package/expat/expat.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
