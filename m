From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Nov 2017 12:57:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-08
In-Reply-To: <87lgjfeo5c.fsf@dell.be.48ers.dk>
References: <20171109070011.4320C209F1@mail.free-electrons.com>
 <20171109072720.ysow3pwt4igf5vva@tarshish>
 <87lgjfeo5c.fsf@dell.be.48ers.dk>
Message-ID: <20171109105743.47prgvexybgmgnk4@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Nov 09, 2017 at 11:34:39AM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Hi Thomas,
>  > On Thu, Nov 09, 2017 at 08:00:11AM +0100, Thomas Petazzoni wrote:
>  >> Hello,
>  >> 
>  >> Build statistics for 2017-11-08
>  >> ===============================
>  >> 
>  >> branch |  OK | NOK | TIM | TOT |
>  >> master | 142 |  31 |   0 | 173 |
>  >> 2017.08.x |   6 |   0 |   0 |   6 |
> 
>  > Nice. Thanks for working on that.
> 
> Yes, thanks!
> 
>  > Unrelated to that (I think), DNS resolution for autobuild.buildroot.net looks 
>  > strange this morning:
> 
>  > $ host autobuild.buildroot.net
>  > autobuild.buildroot.net is an alias for ks383786.kimsufi.com.
>  > ks383786.kimsufi.com has address 94.23.254.152
> 
> What is strange about it? autobuild.buildroot.{net,org} has always been
> a cname to Thomas' machine.

It's just that autobuild has been unreachable earlier this morning. When I 
started looking around this cname seemed suspicious to me. All is OK now.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
