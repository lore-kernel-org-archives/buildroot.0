From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Jun 2013 17:46:49 +0200
Subject: [Buildroot] Why have legal info for host packages?
In-Reply-To: <20130607115100.510530ad@skate>
References: <CANxTyt6LO-Q3orQnXGL873wG5z9f3ufiE6YOUNMuBq--8VMzFQ@mail.gmail.com>
 <20130602161923.GB3510@free.fr> <20130607115100.510530ad@skate>
Message-ID: <20130607154649.GA6124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-06-07 11:51 +0200, Thomas Petazzoni spake thusly:
> On Sun, 2 Jun 2013 18:19:23 +0200, Yann E. MORIN wrote:
> 
> > On 2013-06-02 12:12 -0400, Danomi Manchego spake thusly:
> > > I was using the outputs from "make legal-info" yesterday as the basis for
> > > our embedded product's licenses web page, and found myself modifying
> > > pkg-generic.mk to exclude host packages from the legal info collection.  So
> > > I was wondering - what is the value in including the legal info of packages
> > > built for the host?
> > 
> > Some companies use Buildroot as a base for the SDK and provide pre-built
> > environment to their customers. So, we have to also install legal-info
> > for host packages to cope with this situation.
> 
> Yes, but as we discussed some time ago, the host packages should either
> be identified as such in the legal info, or even maybe a separate
> manifest.csv file should be generated for the host packages.

Indeed. I never said otherwise. I was just pointing out that we also
want to generate it for host packages, and was giving an example why
this was needed.

That this legal-info stuff be generated in a separate location (file,
dir) is orthogonal: we want it generated.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
