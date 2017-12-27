From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Dec 2017 10:47:15 +0200
Subject: [Buildroot] [PATCH] libv4l: restore LFS mismatch fix patch
In-Reply-To: <87d130v9ym.fsf@dell.be.48ers.dk>
References: <2a31dda7a229212bd19f9fb8b2b6f50916fe11cc.1514354092.git.baruch@tkos.co.il>
 <87d130v9ym.fsf@dell.be.48ers.dk>
Message-ID: <20171227084715.xibifbptse3c3vde@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Dec 27, 2017 at 09:41:53AM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Restore the patch that commit 9345b85b47 (libv4l: bump to version
>  > 1.12.6) has wrongly removed. This is needed for LFS builds for 32bit
>  > targets.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/461/46100c008c894e3f998227b2a9c9a79bfcbbda7c/
>  > http://autobuild.buildroot.net/results/63b/63babd09b8a64fd4da80d99c4c2aed25e5532aec/
>  > http://autobuild.buildroot.net/results/92b/92bd49d881ed11b2540e434af57ae7347ac186d2/
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Committed, thanks.
> 
> It seems my patch never got upstreamed :/ Feel free to submit it if you
> actively use libv4l, otherwise I will try to find time to do so.

For that I'll have to actually understand what this patch does.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
