From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:20:20 +0200
Subject: [Buildroot] [Patch v4 2/3] cargo-bootstrap: new package
In-Reply-To: <20170408093406.GB32154@itchy>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-3-eric.le.bihan.dev@free.fr>
 <1491548799.26127.5.camel@embedded.rocks>
 <20170408093406.GB32154@itchy>
Message-ID: <20170408152020.12a89c69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Apr 2017 11:34:06 +0200, Eric Le Bihan wrote:
> Hi!
> 
> On 17-04-07 09:06:39, J?rg Krause wrote:
> > Hi Eric,
> >
> > On Sun, 2017-04-02 at 21:46 +0200, Eric Le Bihan wrote:  
> > > This new package fetches a binary snapshot of Cargo, suitable for the
> > > host, in order to bootstrap the Rust compiler and Cargo, the package
> > > manager.  
> >
> > Why not build it from source?  
> 
> Cargo uses Cargo as its build system, so you need to have a working
> version of Cargo on the host system to build a new version from the
> source code.
> 
> To build the Rust compiler a binary snapshot is enough.

Can you update the commit log to make it clearer? I guess whenever
there's a question on a patch, it often indicates that the commit log
was not detailed enough.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
