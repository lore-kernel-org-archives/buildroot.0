From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Nov 2017 17:50:49 +0200
Subject: [Buildroot] [PATCH 0/4] Fix BR2_HOSTARCH_NEEDS_IA32_*
 autobuilder issues
In-Reply-To: <CACXmViZAuY-59MULsMeRbO1x6X7SwtpFDnU5oGxyafG5yS=MYA@mail.gmail.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
 <CACXmViZAuY-59MULsMeRbO1x6X7SwtpFDnU5oGxyafG5yS=MYA@mail.gmail.com>
Message-ID: <20171102155049.ilfbfavbekak2p4p@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Nov 02, 2017 at 03:30:23PM +0100, Peter Korsgaard wrote:
> Hmm, this apparently never made it to the list.

I got the entire set.

It's archived at 
http://lists.busybox.net/pipermail/buildroot/2017-November/205961.html.

> On Thu, Nov 2, 2017 at 11:45 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> > Hi,
> >
> > The following patch series fixes various autobuilder issues from packages
> > selecting BR2_HOSTARCH_NEEDS_IA32_* without ensuring hostarch is x86(-64),
> > breaking the build on the gcc112 ppc64le autobuilder.
> >
> > --
> > Bye, Peter Korsgaard

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
