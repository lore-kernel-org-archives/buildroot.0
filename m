From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 30 Nov 2011 10:36:38 -0600
Subject: [Buildroot] [PATCH 1/2] iw: fix build with new libnl-3
In-Reply-To: <4ED65A6C.2020003@gmail.com>
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
 <CAGm1_kvpf=bZxzPqgXQ65R_vo6XVp-3KFkjCt_JC8WY32OPaiw@mail.gmail.com>
 <4ED65A6C.2020003@gmail.com>
Message-ID: <201111301036.41643.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed November 30 2011, Daniel Mack wrote:
> I can do this. I wasn't even aware of this branch, and part of the
> reason is that it doesn't show up on the cgit web interface
> (http://git.buildroot.net/buildroot) when there's no trailing slash in
> the URI, which is unfortunately the location the website
> (http://buildroot.uclibc.org/git.html) points visitors to. You can click
> on "refs" and back on "summary" which will add the "/" suffix, and then
> cgit will show the existance of the "next" branch. Very odd.
> 

Confirmed here also.

Just adding the "/" to the URI in the browser bar and hitting "enter"
fixes the display of the "next" branch also.

Mike
