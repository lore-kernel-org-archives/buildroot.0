From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 15:31:32 +0200
Subject: [Buildroot] [PATCHv3 04/20] toolchain: introduce a virtual
 package
In-Reply-To: <CAHkwnC_CoxOe4HH9fUHWY1XynLAfhDoB1x7JCxZ8iHsjgWij-Q@mail.gmail.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHkwnC_wbNa4Mg24WTPGjmmMSk2tYcNfmSzV66CVkzfmZ-2T2A@mail.gmail.com>
 <20131009110251.64401cb3@skate>
 <CAHkwnC_CoxOe4HH9fUHWY1XynLAfhDoB1x7JCxZ8iHsjgWij-Q@mail.gmail.com>
Message-ID: <20131009153132.4da6f79b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed, 9 Oct 2013 14:59:07 +0200, Fabio Porcedda wrote:

> > BASE_TARGETS = toolchain, so there are exactly equivalent. I'm not sure
> > why you say BASE_TARGETS is an implementation detail of the new
> > toolchain virtual package. BASE_TARGETS now never has any other value
> > than just "toolchain".
> 
> Sorry, I've missed that part, now I understand better.

No problem :)

> > Ultimately, toolchain will no longer need to be part of BASE_TARGETS as
> > it will be handled just as a normal package dependency (done by your
> > patches). But I'm trying to do things step by step, progressively.
> > Therefore, in the end, I believe the world rule will no even contain
> > "toolchain" and $(TARGETS_ALL) but just $(PACKAGES),
> 
> Well about the world rule in my patches in the end it contain only the
> "target-post-image" because it's the last step, but that's another
> story.

Yes, indeed. Seen your patches, I think they look good on principle, I
need to test them/have a more detailed look.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
