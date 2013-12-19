From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Dec 2013 11:43:49 +0100
Subject: [Buildroot] [PATCH] lvm2: disable statical building because it
 fails
In-Reply-To: <CAHkwnC9+nr6zX7n-ZYoak-=iT1ZysDL8UoNGe2H7ghuFscS8Ew@mail.gmail.com>
References: <1387263739-3831-1-git-send-email-fabio.porcedda@gmail.com>
 <20131217101137.5c8845a3@skate>
 <CAHkwnC9+nr6zX7n-ZYoak-=iT1ZysDL8UoNGe2H7ghuFscS8Ew@mail.gmail.com>
Message-ID: <20131219114349.108e1147@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 19 Dec 2013 11:36:51 +0100, Fabio Porcedda wrote:

> > Thanks, but you forgot to propagate this new dependency to the reverse
> > dependencies of lvm2, and you forgot to add the corresponding comment.
> > See
> > http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options.
> 
> Ok, thanks, i will send an updated patch.

Looking more at the problem, isn't it possible to fix the static build
of LVM2, rather than preventing LVM2 from being selected in this case?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
