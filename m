From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Sep 2013 17:56:05 +0200
Subject: [Buildroot] [RFCv1 02/11] toolchain-crosstool-ng: remove support
In-Reply-To: <20130906155347.GF3271@free.fr>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130906155347.GF3271@free.fr>
Message-ID: <20130906175605.4ae2550e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 6 Sep 2013 17:53:47 +0200, Yann E. MORIN wrote:

> On 2013-09-05 23:27 +0200, Thomas Petazzoni spake thusly:
> > In order to avoid the work of converting the toolchain-crosstool-ng
> > logic to the package infrastructure, we remove it from Buildroot,
> > since it has been deprecated since quite some time.
> 
> BTW, you forgot to remove references to the crosstool-NG backend from
> the manual while at it. ;-)

Yes, that's intentional for now. I've sent this patch set as an RFC to
get some feedback and testing. If the feedback is positive, I'll post
an updated version that includes the changes to the manual.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
