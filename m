From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Feb 2016 00:31:39 +0100
Subject: [Buildroot] [PATCH] package/util-linux: remove patch for uClibc
 support
In-Reply-To: <1455920889-14777-1-git-send-email-romain.naour@gmail.com>
References: <1455920889-14777-1-git-send-email-romain.naour@gmail.com>
Message-ID: <56C8F75B.7060701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/19/16 23:28, Romain Naour wrote:
> This patch is not needed anymore since the uClibc support
> has been removed from Buildroot.
> This patch was needed for uClibc <= 0.9.33 support.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Build tested with 2014R1 bfin toolchain.

 But that toolchain is using uClibc 0.9.33, no? So how come it still works then?


 Regards,
 Arnout

> The arc-1015.12 toolchain shouldn't trigger the build issue
> since it's based on uClibc-snapshot (upstream HEAD)
> ---
>  ...fine-mkostemp-for-older-version-of-uClibc.patch | 50 ----------------------
>  1 file changed, 50 deletions(-)
>  delete mode 100644 package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
