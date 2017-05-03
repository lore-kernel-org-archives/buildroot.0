From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 May 2017 20:00:19 +0300
Subject: [Buildroot] [PATCH 2/2] picocom: force target LDFLAGS
In-Reply-To: <87h912c67z.fsf@dell.be.48ers.dk>
References: <04e1e4d95a425dfc0e0650088cb0120a9f3e46a8.1493815595.git.baruch@tkos.co.il>
 <f7abac9c0ca017bffd3109f7df0d6bfa7f099281.1493815595.git.baruch@tkos.co.il>
 <87h912c67z.fsf@dell.be.48ers.dk>
Message-ID: <20170503170019.tzz5ok3gwkq67v5z@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, May 03, 2017 at 05:25:52PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > This allows a static build of picocom when BR2_STATIC_LIBS=y but the toolchain
>  > provides static and shared libraries.
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Committed, thanks.
> 
> Is this only an issue for picocom 2.2, or also something we should
> backport for the 2017.02.x branch?

Version 2.1 is also affected. But I'm not sure the issue is bad enough for a 
backport.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
