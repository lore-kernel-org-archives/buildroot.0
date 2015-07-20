From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 20 Jul 2015 13:31:33 +1000
Subject: [Buildroot] [PATCH v3 2/2] powerpc-utils: optionally use librtas
In-Reply-To: <20150713184418.66c0298b@free-electrons.com>
References: <cover.1432015191.git.sam.bobroff@au1.ibm.com>
 <9a73202315e0a236b78d9644905c20b79572f93d.1432015191.git.sam.bobroff@au1.ibm.com>
 <20150713184418.66c0298b@free-electrons.com>
Message-ID: <20150720033133.GB15460@ocelot.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 13, 2015 at 06:44:18PM +0200, Thomas Petazzoni wrote:
> Dear Sam Bobroff,
> 
> On Tue, 19 May 2015 15:59:56 +1000, Sam Bobroff wrote:
> > Now that librtas is available, optionally use it with powerpc-utils to
> > enable it's RTAS dependant functionality.  It is used by default, as
> > most distros do, but made optional because it adds several new programs
> > and significantly increases the size of the installed package.
> > 
> > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> > ---
> > v3:
> 
> Applied after propagating the glibc dependency of librtas, as noted by
> Romain Naour.
> 
> Thanks!
> 
> Thomas

Baruch, Romain and Thomas,

Thanks for the reviews and improvements!

Cheers,
Sam.
