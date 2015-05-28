From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 May 2015 12:53:56 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-27
In-Reply-To: <CAMo8Bf+rVtLH0OizwAcc4Wds50UkgpMppS+m1=RGL3=dfA8iJQ@mail.gmail.com>
References: <20150528063014.33A10100E89@stock.ovh.net>
 <CAMo8Bf+rVtLH0OizwAcc4Wds50UkgpMppS+m1=RGL3=dfA8iJQ@mail.gmail.com>
Message-ID: <20150528095356.GD2260@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Thu, May 28, 2015 at 12:49:35PM +0300, Max Filippov wrote:
> On Thu, May 28, 2015 at 9:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Build statistics for 2015-05-27
> >
> >       xtensa |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/15aadcad23a79bdb64789a6edd271f1aca999973/
> 
> Fixed by https://patchwork.ozlabs.org/patch/476389/

Thanks for fixing. But technically, since this build uses an external 
toolchain, it will only be fixed when Thomas rebuilds the toolchain.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
