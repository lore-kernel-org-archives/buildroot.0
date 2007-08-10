From: Erik Andersen <andersen@codepoet.org>
Date: Fri, 10 Aug 2007 12:55:12 -0600
Subject: [Buildroot] X11R7 packages available
In-Reply-To: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
References: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
Message-ID: <20070810185512.GA4186@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed Jul 04, 2007 at 10:29:52AM +0200, Julien Letessier wrote:
> Hi list,
> 
> As promised, here is
> - a full set of X11R7 and support packages (including Mesa3D OpenGL, 2D and
> 3D drivers, Xv support)
> - an updated version (release 4) of the autotools patch
> 
> The files are available from:
>   http://bazaar.mezis.net/buildroot_autotools4.patch.bz2
>   http://bazaar.mezis.net/buildroot_x11r7_v1.tar.bz2
> [because mailman won't let me attach them]
> 
> Extract the archive, move packages to your buildroot package directory, and
> remember to add
>   source "package/Config.xorg7.in"
> to your package/Config.in
> 
> Hopefully I didn't forget a dependancy package.
> 
> Any feedback is welcome... once this is tested I think it would be a good
> idea to add the whole thing to Buildroot.

Fantastic.  I've merged your patches with very minor changes.
It doesnt quite build for me, but hopefully we can get that
sorted out soon.  This was clearly a huge undertaking and a
true labor of love.  Thanks!

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
