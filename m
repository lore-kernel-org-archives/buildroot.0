From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jan 2016 09:17:42 +0100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160128024442.GA5589@tungsten.ozlabs.ibm.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
 <20160124191236.GQ17143@waldemar-brodkorb.de>
 <20160124213607.6e3b1257@free-electrons.com>
 <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
 <20160127093256.77169e7d@free-electrons.com>
 <20160128024442.GA5589@tungsten.ozlabs.ibm.com>
Message-ID: <20160128091742.45cad80d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jan 2016 13:44:42 +1100, Sam Bobroff wrote:

> > You need to select the power8 processor for the issue to reproduce. It
> > doesn't appear with power7 for example.
> 
> Hmm, while that's not surprising, I've used that combination of options (power8
> big-endian with gcc 4.9.x and gcc 5.x) and it works fine for me. Have you tried
> building from completely clean, including clearing or disabling ccache?

Yes, I'm doing completely clean builds, I never use ccache, and always
start my builds from scratch.

Waldemar, are you able to reproduce the build failure on Power8 ?

> Maybe the host architecture matters? Is that x86_64? What gcc do you have on
> the host?

Yes, x86_64, the host gcc is quite old (4.4) since I'm using Debian 6.0
on this build server instance.

I've restarted a build on my laptop, which has a more modern distro,
I'll let you know the results.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
