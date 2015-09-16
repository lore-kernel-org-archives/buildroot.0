From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 13:41:00 +0200
Subject: [Buildroot] [PATCH] libselinux: use correct definition of ARCH
In-Reply-To: <55F94891.4070908@imgtec.com>
References: <1442398203-46701-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150916123943.16869e63@free-electrons.com>
 <55F94891.4070908@imgtec.com>
Message-ID: <20150916134100.48bb83be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Sep 2015 11:46:41 +0100, Vicente Olivert Riera wrote:

> > I'm surprised we never caught this through the autobuilder testing, but
> > I guess all autobuilder machines are x86_64 based, which will not
> > exhibit the problem.
> 
> Yeah, I set a new autobuilder to run only MIPS builds since currently
> there aren't many autobuild failures to look at (I needed more!), and I
> put it on a x86 virtual machine just to also catch possible issues due
> to building on a 32-bit host machine, and because I already had another
> autobuilder running on a x86_64 host. And look, I have already catch one! :D

Great! Do you want an account to submit your build results
automatically to autobuild.buildroot.org?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
