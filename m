From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Dec 2011 16:24:14 +0100
Subject: [Buildroot] [PATCH 1/2] iw: fix build with new libnl-3
In-Reply-To: <4ED65A6C.2020003@gmail.com> (Daniel Mack's message of "Wed, 30
 Nov 2011 17:31:40 +0100")
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
 <1322665560-29888-1-git-send-email-zonque@gmail.com>
 <CAGm1_kvpf=bZxzPqgXQ65R_vo6XVp-3KFkjCt_JC8WY32OPaiw@mail.gmail.com>
 <4ED65A6C.2020003@gmail.com>
Message-ID: <8762h6ouw1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 >> this file has gone in next. Please rebase your patches on the next

 Daniel> I can do this. I wasn't even aware of this branch, and part of the
 Daniel> reason is that it doesn't show up on the cgit web interface
 Daniel> (http://git.buildroot.net/buildroot) when there's no trailing slash in
 Daniel> the URI, which is unfortunately the location the website
 Daniel> (http://buildroot.uclibc.org/git.html) points visitors to. You can click
 Daniel> on "refs" and back on "summary" which will add the "/" suffix, and then
 Daniel> cgit will show the existance of the "next" branch. Very odd.

Yes, I know. I've reported it to the osuosl.org guys a while back, and
they are looking into it, but so far without any luck.

I've now fixed the website link.

-- 
Bye, Peter Korsgaard
