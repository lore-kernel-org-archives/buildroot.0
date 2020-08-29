From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:09:21 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libidn: bump to version
 1.36
In-Reply-To: <20200829201754.2823090-1-fontaine.fabrice@gmail.com>
References: <20200829201754.2823090-1-fontaine.fabrice@gmail.com>
Message-ID: <20200829230921.4ef6ed49@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:17:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update indentation in hash file (two spaces)
> 
> Extract from NEWS:
>  - Fix unlikely memory leak in idna_to_unicode_4z4z().
>  - Check codepoint validity in punycode_decode() and punycode_decode().
>  - tld: Add U+00EF to .nl TLD table.
>  - Indent code.
>  - Translation fixes.
>  - Update gnulib files.
>  - API and ABI is backwards compatible with the previous version.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libidn/libidn.hash | 8 ++++----
>  package/libidn/libidn.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
