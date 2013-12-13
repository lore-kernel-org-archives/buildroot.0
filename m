From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Fri, 13 Dec 2013 12:07:05 +0100
Subject: [Buildroot] libsvgtiny/NetSurf status
In-Reply-To: <87d2l1yq30.fsf@dell.be.48ers.dk>
References: <CACjG4BLSNd+qguuT2Pb08z=5rQPS2AGKQaefqcKKVCbDK4xT+g@mail.gmail.com>
 <87d2l1yq30.fsf@dell.be.48ers.dk>
Message-ID: <CACjG4BKOP=zK5=CdPRmOucbEtY_AR5mZQ5KcB8mZVzhY6HB6Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/13 Peter Korsgaard <jacmet@uclibc.org>

>
> And these are not part of the release tarball?
>

No that's the problem.

 > The buildsystem (basically only contains Makefiles) should be
>  > packaged as a host package right ?
>
> It's not really for the host, so perhaps it would make more sense to
> have it as a target package (which only installs it under staging).
>
> Yes, you're right.


>  > What about the dependency on the project libraries ? Should I create
>  > a package for every dependency even if they are going to be used only
>  > for this library ?  Or is it possible to create a "bundle" ?
>
> I think the cleanest would be seperate packages, but I don't really know
> much about netsurf and its libraries.
>
>
>  > Moreover, netsurf browser is pretend to be a small and fast web
>  > browser and can work with a frambuffer, does anyone already try it ?
>  > I guess, if the work to bump libsvgtiny is done, we could add NetSurf
>  > easily.
>
> Yes, sounds good. I added libsvgtiny some time ago as I had a look at it
> for a project, but I never ended up using it in the end, so no problem
> from me to bump the version.
>

Ok, so I will try to have a look later, but if someone interested in
netsurf/libsvgtiny just go for it.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131213/3d527bb9/attachment-0001.html>
