From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jun 2013 11:51:00 +0200
Subject: [Buildroot] Why have legal info for host packages?
In-Reply-To: <20130602161923.GB3510@free.fr>
References: <CANxTyt6LO-Q3orQnXGL873wG5z9f3ufiE6YOUNMuBq--8VMzFQ@mail.gmail.com>
 <20130602161923.GB3510@free.fr>
Message-ID: <20130607115100.510530ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 2 Jun 2013 18:19:23 +0200, Yann E. MORIN wrote:

> On 2013-06-02 12:12 -0400, Danomi Manchego spake thusly:
> > I was using the outputs from "make legal-info" yesterday as the basis for
> > our embedded product's licenses web page, and found myself modifying
> > pkg-generic.mk to exclude host packages from the legal info collection.  So
> > I was wondering - what is the value in including the legal info of packages
> > built for the host?
> 
> Some companies use Buildroot as a base for the SDK and provide pre-built
> environment to their customers. So, we have to also install legal-info
> for host packages to cope with this situation.

Yes, but as we discussed some time ago, the host packages should either
be identified as such in the legal info, or even maybe a separate
manifest.csv file should be generated for the host packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
