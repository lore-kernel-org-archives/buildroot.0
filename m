From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Nov 2017 08:46:19 +0100
Subject: [Buildroot] [PATCH] chrony: fix build with musl
In-Reply-To: <20171116040130.qqgusklzyv4y2z2r@tarshish>
References: <464b10815ee2e59be56aef7c79d5569ecde913f5.1510659474.git.baruch@tkos.co.il>
 <20171115231141.4dfc7b97@windsurf.lan>
 <20171116040130.qqgusklzyv4y2z2r@tarshish>
Message-ID: <20171116084619.30f091df@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 06:01:30 +0200, Baruch Siach wrote:

> > >  .../chrony/0001-ntp-fix-build-with-musl-libc.patch | 39 ++++++++++++++++++++++
> > >  1 file changed, 39 insertions(+)
> > >  create mode 100644 package/chrony/0001-ntp-fix-build-with-musl-libc.patch  
> > 
> > Applied to master, thanks. Is the problem fixed in upstream musl? If
> > not, did you report the problem?  
> 
> musl version 1.1.18 defines the SCM_TIMESTAMPING_PKTINFO macro. So once we 
> bump musl and rebuild the toolchain, we can remove this patch.

OK, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
