From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Sep 2012 15:46:31 +0200
Subject: [Buildroot] [PATCH] external-toolchain:
 BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
In-Reply-To: <20120925103952.20f4d20a@skate>
References: <1348544993-5682-1-git-send-email-baruch@tkos.co.il>
 <20120925095442.01c07b54@skate> <20120925083330.GD4439@tarshish>
 <20120925103952.20f4d20a@skate>
Message-ID: <20120925134631.GE4439@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 25, 2012 at 10:39:52AM +0200, Thomas Petazzoni wrote:
> Dear Baruch Siach,
> 
> On Tue, 25 Sep 2012 10:33:30 +0200, Baruch Siach wrote:
> 
> > This is exactly what I meant to say, but the text surely needs to be clearer 
> > as you suggest. What feature do you think we need to mention as minimal 
> > requirements in the help text?
> 
> I have no idea, since I have never looked at what eglibc provides in
> terms of configurability :) I guess Yann can give details on this, he
> is quite certainly a lot more aware than I am about what the eglibc
> options are.

Well, after a little thought, maybe we shouldn't get into configuration 
details here and just say something general like: "Warning: using a toolchain 
with eglibc configuration lacking key features (examples?) may result in build 
failures, depending on your choice of packages."

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
