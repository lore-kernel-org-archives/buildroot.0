From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jun 2013 19:15:58 +0200
Subject: [Buildroot] [PATCH] sconeserver: add patch to fix build issue
In-Reply-To: <CAHt8ZCMYSSHYyPofmMacBUK1v1cyttyOHCuY9cQJ=W_taZa3yg@mail.gmail.com>
References: <1371401514-17259-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCMYSSHYyPofmMacBUK1v1cyttyOHCuY9cQJ=W_taZa3yg@mail.gmail.com>
Message-ID: <20130616191558.741a3f52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Sun, 16 Jun 2013 17:56:14 +0100, Simon Dawson wrote:

> > Simon, feel free to upstream this patch. Since I know you've been
> > following the sconeserver development, it's probably easier if you
> > upstream the patch.
> > ---
> 
> Okay; will do.

Thanks!

> > +The '==' shell operator doesn't work in POSIX shells, so when sh is
> > +symlinked to a POSIX shell such as dash and not a bash shell, the
> > +configure tests that use this operator fail to work.
> > +
> > +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Aha; that explains why I couldn't get it to fail on my build machine.
> Well spotted!

Yeah, I already encountered the issue with some other configure scripts
using bashims.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
