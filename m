From: Nicholas Kinar <n.kinar@usask.ca>
Date: Sun, 29 Nov 2009 14:31:25 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <87einh2n3w.fsf@macbook.be.48ers.dk>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
Message-ID: <4B12DA1D.3020508@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
> OK. I still think you'll have an easier time doing your buildroot work
> on a (virtual) Linux box, but it's your choice..
>   
Of course, Linux is much easier at many things, which is the reason why 
it is used for projects such as Busybox.


> Yes, the gumstix people unfortunately haven't been that good at
> submitting their fixes back to us :/
>   
That's always an issue with having a forked or separate build tree from 
the main project.  IMHO, I don't like separate build trees, but 
apparently it is the sometimes the way that software development is 
accomplished.

> I agree that there isn't any technical reason why BR shouldn't work on
> MacOSX, but currently there's no active developers using it (I do write
> this on a macbook, but I very rarely boot into macosx).
>   
Strangely enough, I'm also writing this on a macbook, and I boot more 
into Linux than any other of the three operating systems that I run.  I 
won't mention the name of the third operating system, but I tend to use 
it only for engineering software that won't run on Linux.  ;-)

> The problem isn't just getting the makefiles of BR to work on MacOSX,
> the biggest problem is all the build scripts of the individual packages.
>   
Agreed.

> With that said, patches to make stuff work better on MacOSX are welcome,
> as long as they aren't too ugly / add too much extra complexity for such
> a rarely used setup.
>
>   

This would be something to add to my to-do list.  I know that making 
FOSS software run on a non-free OS is somewhat of a contradiction, but 
IMHO it helps to encourage adoption among a segment of users that 
exclusively use a setup such as Mac OS X.  I believe that a good example 
of this type of adoption is Firefox, which runs on all of the "Big 
three" operating systems.
Besides, it might be kind of fun to ensure that buildroot can run on all 
flavours of GNU/Linux/Unix.


Nicholas
