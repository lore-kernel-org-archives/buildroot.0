From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:38:56 +0200
Subject: [Buildroot] [PATCH 1/1] musl: Honor BR2_STATIC_LIBS /
 BR2_SHARED_LIBS
In-Reply-To: <CAEHm_shswg6pPrMgif+OY2w3qqW15d1Amkf4avUPum_OpF-MEA@mail.gmail.com>
References: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
 <20151014233507.23a93657@free-electrons.com>
 <CAEHm_shswg6pPrMgif+OY2w3qqW15d1Amkf4avUPum_OpF-MEA@mail.gmail.com>
Message-ID: <20151015093856.5f9d0dbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles,

On Wed, 14 Oct 2015 22:23:12 +0000, Charles Duffy wrote:
> On Wed, Oct 14, 2015 at 4:35 PM Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
> 
> > Could you instead try the following change:
> >
> > -                       --disable-gcc-wrapper)
> > +                       --disable-gcc-wrapper \
> > +                       $(SHARED_STATIC_LIBS_OPTS))
> >
> >
> Works perfectly. Should I bother resubmitting, or are you inclined to make
> the change directly?

I did the change and applied. See
http://git.buildroot.net/buildroot/commit/?id=bb41933d3642f44c8d2db07886b2e5bf18b97fad.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
