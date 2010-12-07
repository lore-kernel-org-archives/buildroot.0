From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Dec 2010 19:58:18 +0100
Subject: [Buildroot] [PATCH] oprofile: Don't install binutils in the
 target filesystem.
In-Reply-To: <AANLkTinDHGaCtW+uA5b=ndfoMFORb4QH0J811zSops7f@mail.gmail.com>
References: <AANLkTi=qoF_Xq8jNoieWCAQCGR-5VzQaYZV85EO3KfYz@mail.gmail.com>
	<AANLkTinDHGaCtW+uA5b=ndfoMFORb4QH0J811zSops7f@mail.gmail.com>
Message-ID: <20101207195818.596738ce@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 7 Dec 2010 11:21:59 +0000
Will Newton <will.newton@gmail.com> wrote:

> On Tue, Nov 30, 2010 at 4:29 PM, Will Newton <will.newton@gmail.com>
> wrote:
> > oprofile needs libbfd, but does not require all the binutils tools
> > installing in the target filesystem. This saves a lot of space
> > on the target filesystem.
> >
> > Signed-off-by: Will Newton <will.newton@imgtec.com>
> 
> Is this ok for 2011.02?

Gustavo Zacarias is cleaning up the binutils package, so I'm sure he
will take care of this as well :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
