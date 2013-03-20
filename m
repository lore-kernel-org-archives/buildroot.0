From: Will Moore <will.moore@beraninstruments.com>
Date: Wed, 20 Mar 2013 12:29:52 -0000
Subject: [Buildroot] Interest in upgrading syslinux to 5.x?
In-Reply-To: <2F83768108B8464BAD971EB5BCDBE1E5@beraninstruments.com.local>
References: <CAKduhSuJ_-2B7i7YOKyuErfhve_CXi1UvmNX_U7iQUXYt3c7hw@mail.gmail.com><ECCCCA15FFC640AAA891EA6FC4BB8F28@beraninstruments.com.local>
 <CAKduhSt3Vkpc+bLP4UM8On472BZqZ7aRVRmFZsG0kOKEm4XtEg@mail.gmail.com>
 <2F83768108B8464BAD971EB5BCDBE1E5@beraninstruments.com.local>
Message-ID: <EBADBC9F10F448F49B067CB7A90C908C@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Will Moore
> Sent: 20 March 2013 09:51
> 
> Hi Daniel, please bottom post, I've killed off the old part of the thread to
> hide the sin ;-)
> 
> > -----Original Message-----
> > From: Daniel Price [mailto:daniel.price at gmail.com]
> > Sent: 20 March 2013 09:26
> > To: Will Moore
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] Interest in upgrading syslinux to 5.x?
> >
> > Thanks Will, this is very helpful.  And the document you mentioned is
> > a good reference, especially the background about 'make installer'--
> > while I've been building the whole thing from source, I had been
> > wondering what that was about.  I have a working syslinux-5.01 build
> > which seems to solve my problems, but I am by no means an expert.  To
> > answer your other question: yes, I think we have similar problems-- I
> > need to support install from media and install from pxe, in a
> > development environment.
> >
> > Today I posted a small patch to upgrade syslinux to 4.06.  You could
> > test that if you like.  It seems like 4.06 cleaned up some rough edges
> > when compiling 4.05-- or at least for me it did.
> 
> I will see what I can do.
> 
> >
> > I guess we could add to buildroot a 'boot/syslinux5' recipe as a peer
> > to 'boot/syslinux,' to provide some time for people to transition over
> > (if the project heads were OK with that).  It has seemed to me by
> > reading various forums that there are some transition headaches.
> 
> I am not sure on the policy for multiple versions but I know generally
> buildroot
> does not do this.  This is a question for Peter and co...
> 
> If 4.06 is enough for you and the paint is still a little wet on 5.x then IMHO
> better to stick to implementing the new features in 4.06 then updating at some
> later time.

It might help to see what Arnout is up to with his grub2 patch which is also
looking at providing a bootloader with host and target tools.  See
http://patchwork.ozlabs.org/patch/191813/

> 
> >
> >          -dp
> >
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
