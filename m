From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 08:55:01 +0200
Subject: [Buildroot] [PATCHv2] toolchain: Add glibc support for ARCv2
In-Reply-To: <7f5d9ba0-b90e-f9f1-f489-9ae1959f18be@mind.be>
References: <20171010133150.42030-1-didin@synopsys.com>
 <20171010231755.110e806b@windsurf.lan>
 <7f5d9ba0-b90e-f9f1-f489-9ae1959f18be@mind.be>
Message-ID: <20171011085501.66b16258@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Oct 2017 23:26:56 +0200, Arnout Vandecappelle wrote:

> > when we bump to glibc 2.26.1  
> 
>  Is there any hope of that? I thought the glibc maintainers had made it clear
> that there wouldn't be point releases?

Yes, there has been a lot of discussion, pushed by Romain and Yann, and
with the support from people of other distros, and apparently, the
glibc maintainers have understood the need for dot releases with fixes.

That being said, my point stands: when we bump to 2.27, not sure the
ARC folks will have bumped at exactly the same time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
