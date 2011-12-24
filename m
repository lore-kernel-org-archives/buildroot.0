From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 24 Dec 2011 16:56:09 +0100
Subject: [Buildroot] [PATCH 1/2] iw: fix build with new libnl-3
In-Reply-To: <8762h6ouw1.fsf@macbook.be.48ers.dk>
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
 <1322665560-29888-1-git-send-email-zonque@gmail.com>
 <CAGm1_kvpf=bZxzPqgXQ65R_vo6XVp-3KFkjCt_JC8WY32OPaiw@mail.gmail.com>
 <4ED65A6C.2020003@gmail.com> <8762h6ouw1.fsf@macbook.be.48ers.dk>
Message-ID: <4EF5F619.3060906@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 24.12.2011 16:24, schrieb Peter Korsgaard:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>  >> this file has gone in next. Please rebase your patches on the next
>
>  Daniel> I can do this. I wasn't even aware of this branch, and part of the
>  Daniel> reason is that it doesn't show up on the cgit web interface
>  Daniel> (http://git.buildroot.net/buildroot) when there's no trailing slash in
>  Daniel> the URI, which is unfortunately the location the website
>  Daniel> (http://buildroot.uclibc.org/git.html) points visitors to. You can click
>  Daniel> on "refs" and back on "summary" which will add the "/" suffix, and then
>  Daniel> cgit will show the existance of the "next" branch. Very odd.
Even more strange:

http://git.buildroot.net/buildroot

Branch Commit message                                       
Author          Age
master <http://git.buildroot.net/buildroot/log/>hostapd: fix libnl
linking with BR2_PREFER_STATIC_LIB
<http://git.buildroot.net/buildroot/commit/>Peter Korsgaard91 min.

manually adding a "/" at the end of the URL gives:

http://git.buildroot.net/buildroot/:

Branch Commit message                                       
Author          Age
master <http://git.buildroot.net/buildroot/log/>xapp_xman: fix
dependencies                          
<http://git.buildroot.net/buildroot/commit/>Peter Korsgaard29 hours
next <http://git.buildroot.net/buildroot/log/?h=next>   libroxml: bump
version to 2.1.2                      
<http://git.buildroot.net/buildroot/commit/?h=next>Tristan Lelong   4 weeks

A nice time to all

Stephan
> Yes, I know. I've reported it to the osuosl.org guys a while back, and
> they are looking into it, but so far without any luck.
>
> I've now fixed the website link.
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111224/9774ded9/attachment.html>
