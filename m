From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Feb 2017 20:02:32 +0200
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214142725.1b9e98ae@free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
Message-ID: <20170214180232.u2m4hirisgquonui@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 14, 2017 at 02:27:25PM +0100, Thomas Petazzoni wrote: 
> >       x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/b3c31e803ff552a196ce5717372c09d6f64c91bf
> 
> error: redefinition of 'struct ethhdr'
> 
> I believe this has been fixed by the rebuild of the toolchains I
> deployed yesterday, which has the improvements done by Baruch. Baruch,
> could you confirm?

I confirmed the tcpreplay builds successfully with the newly built 2017.02-rc1 
based x86-64-musl toolchain.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
