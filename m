From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:56:37 +0200
Subject: [Buildroot] [PATCH v2,
 3/3] package/libarchive: add zstd optional dependency
In-Reply-To: <20200228221236.1982482-3-fontaine.fabrice@gmail.com>
References: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
 <20200228221236.1982482-3-fontaine.fabrice@gmail.com>
Message-ID: <20200425215637.4518d979@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 23:12:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zstd is available since version 3.3.3 and
> https://github.com/libarchive/libarchive/commit/26838cf5c17642f57192753cc5c3880b16b65ba3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libarchive/libarchive.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

I applied this one... and then reverted because in the mean time
another patch from Thomas DS was merged, which was doing the same thing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
