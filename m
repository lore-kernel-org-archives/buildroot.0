From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 16:14:47 +0200
Subject: [Buildroot] [PATCH 0/3 v2] core/pkg-generic: store
 package<->files for staging and host
In-Reply-To: <cover.1491427248.git.yann.morin.1998@free.fr>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
Message-ID: <405401d0-930e-f230-2409-3a4290614d9c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-04-17 23:20, Yann E. MORIN wrote:
> Hello All!
> 
> This small series does for staging and host as we do for target:
> store the list of installed files and relate them to the package
> that installed each.

 This series collides with ThomasDS'es extension with symlinks and directories
(http://patchwork.ozlabs.org/patch/724235/ and
http://patchwork.ozlabs.org/patch/724236/). Could you perhaps merge the series?


 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
>   - split in three patches
>   - in addition to staging, also store for host
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit 4f50f4928ca3855d9d1b1b9699d2cb37e4ca65da
> 
>   Add out-of-source U-Boot device tree support (2017-04-05 22:29:23 +0200)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to 44910f2975b83c91148d08f3df11ea048eea0609
> 
>   core/pkg-generic: store file->package list for staging and host too (2017-04-05 23:15:27 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (3):
>       core/pkg-generic: rmove intermediate file-list files
>       core/pk-generic: redirect only wsa when listing package's isntalled files
>       core/pkg-generic: store file->package list for staging and host too
> 
>  package/pkg-generic.mk | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
