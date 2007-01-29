From: Philippe Ney <philippe.ney@pardes.ws>
Date: Mon, 29 Jan 2007 08:47:29 +0100
Subject: [Buildroot] newbie comment/question
In-Reply-To: <45BD7FCC.7070801@critical.com>
References: <45BD7FCC.7070801@critical.com>
Message-ID: <20070129084729.53400382.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I downloaded BuildRoot according to the documentation, tried to jump 
> ahead but failed, then went back to the documentation and found that a 
> default build failed too.  The problem was that the latest uclibc 
> snapshot failed to build.  I got over that by falling back to the 
> uclibc.x.x.1 option instead.  (This had worked when I tried to jump 
> ahead, but my attempt to build for an i486 target then failed on some 
> sort of missing kernel patch target.)  OK, with this i686 build complete 
> (after falling back to an earlier version of uclibc), I was unable to 
> find a kernel to load onto my target.  I didn't see this problem 
> documented anywhere.  How do I compile (or cross-compile, since my goal 
> is to use BuildRoot as a cross-platform development tool if possible) a 
> kernel image under BuildRoot?  Is this outside the scope of BuildRoot?  
> I just came over from OpenEmbedded because their support for uclibc 
> seems to be deficient, and I didn't see any mention of kernel building 
> in the BuildRoot docs.  Any help would be appreciated.

Hello,

Sure you can !
In the sources, have a look in target/device
And in the configuration view go in "Board Support Options"

Philippe
