From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 15 Jul 2014 21:27:51 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
Message-ID: <CABbD_XDNK_=CK3A6xQECHr_6-YyccqEcggWg-Mux_sWyv4_uLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


> Then there are a number of bug reports that I currently care less about.
> Several of them are related to new packages (no bugs), some of them
> are there to indicate that certain packages are disabled on a given
> configuration, and some are real problems.
> Takers for these bugs?
>
> 3427 enhancement s.martin49 at gmail.com New package: nginx
>

nginx is not using a "normal" autoconfigure/automake system, so
cross-compiling it is nearly impossible. I've some experimental patch,
which still needs a lot of work. I'm not sure if it can be integrated
without completely rewriting the nginx build infrastructure.


> 3991 enhancement unassigned at buildroot.uclibc.org New Package:
> open-vm-tools (Vmware Tools)
>

I've sent 2 patches to make this work,
http://patchwork.ozlabs.org/patch/338483/ is the second one based on the
comments of Thomas.
It's broken now, because of the procps -> procps-ng change, and also a new
version of openvmtools is out since. I'll send a new updated patch in the
near future. Any feedback is appreciated.

BR
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140715/6b6799fc/attachment.html>
