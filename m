From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Jan 2021 13:54:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump version to
 3.0.12
In-Reply-To: <87y2gl8ivg.fsf@dell.be.48ers.dk>
References: <20210120073900.855895-1-bernd.kuhls@t-online.de>
 <87y2gl8ivg.fsf@dell.be.48ers.dk>
Message-ID: <20210122135442.7bb32ec1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 09:40:19 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:  
> 
>  > Removed patch which was applied upstream, removed md5 hash.
>  > Security Bulletin: https://www.videolan.org/security/sb-vlc3012.html
>  > Fixes CVE-2020-26664: https://nvd.nist.gov/vuln/detail/CVE-2020-26664  
> 
>  > Added CPE_ID, cpe:2.3:a:videolan:vlc_media_player is a valid CPE
>  > identifier for this package:
>  > https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Avideolan%3Avlc_media_player&status=FINAL  
> 
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>  
> 
> Committed to 2020.02.x and 2020.11.x, thanks.

Regarding the backport to 2020.02.x/2020.11.x, I almost asked Bernd to
change the patch to split the version bump from the CPE information
addition. Indeed, the CPE information added by this patch doesn't make
much sense in the context of 2020.02.x.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
