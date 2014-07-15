From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:12:34 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <CABbD_XDNK_=CK3A6xQECHr_6-YyccqEcggWg-Mux_sWyv4_uLQ@mail.gmail.com>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <CABbD_XDNK_=CK3A6xQECHr_6-YyccqEcggWg-Mux_sWyv4_uLQ@mail.gmail.com>
Message-ID: <20140715221234.25222f2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Tue, 15 Jul 2014 21:27:51 +0200, K?roly Kasza wrote:

> > 3427 enhancement s.martin49 at gmail.com New package: nginx
> 
> nginx is not using a "normal" autoconfigure/automake system, so
> cross-compiling it is nearly impossible. I've some experimental patch,
> which still needs a lot of work. I'm not sure if it can be integrated
> without completely rewriting the nginx build infrastructure.

Looking at the Yocto/OpenEmbedded recipe might be useful:
http://cgit.openembedded.org/meta-openembedded/commit/?id=c6e1be52b71c9c234de6aebd036a0e7898a89338.

> > 3991 enhancement unassigned at buildroot.uclibc.org New Package:
> > open-vm-tools (Vmware Tools)
> >
> 
> I've sent 2 patches to make this work,
> http://patchwork.ozlabs.org/patch/338483/ is the second one based on the
> comments of Thomas.
> It's broken now, because of the procps -> procps-ng change, and also a new
> version of openvmtools is out since. I'll send a new updated patch in the
> near future. Any feedback is appreciated.

Make sure to also include <pkg>_LICENSE and <pkg>_LICENSE_FILES when
you send a new version of the open-vm-tools package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
