From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:09:45 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <CAGkQfmPkFLwe5V9c=XzRjOdPuoSXbB_TUX8nKpWtz-YGBC-rsw@mail.gmail.com>
References: <20160601232654.07800a9b@free-electrons.com>
 <20160608221354.171bdc47@free-electrons.com>
 <CAGkQfmPkFLwe5V9c=XzRjOdPuoSXbB_TUX8nKpWtz-YGBC-rsw@mail.gmail.com>
Message-ID: <20160609100945.7c033ef5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jun 2016 10:02:50 +0200, Romain Izard wrote:

> >>  4/ coreutils: allow selection of installed programs
> >>     http://patchwork.ozlabs.org/patch/577829/
> >>
> >>     There's been a lengthy discussion, but no real conclusion. Of
> >>     course, we are questioning the value of having so many fine-grained
> >>     Config.in options.  
> >
> > Nobody cared.  
> 
> Please drop it, I'm not using it anymore.

Thanks for your feedback. To be honest, I believe it was really too
fine-grained, and potentially something a bit annoying to maintain over
time.

You can always use a post-build script to get rid of unused tools.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
