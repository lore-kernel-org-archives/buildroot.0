From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 11:08:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-12-01
In-Reply-To: <529C5859.9020709@imgtec.com>
References: <20131202073003.0B5491014FD@stock.ovh.net>
 <529C5859.9020709@imgtec.com>
Message-ID: <20131202110815.7c5e4e72@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 2 Dec 2013 09:52:25 +0000, Markos Chandras wrote:
> On 12/02/2013 07:30 AM, Thomas Petazzoni wrote:
> >        mips |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/166a3b56f72e38ca806e61aa8296545b91a6ae93/
> >         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/055b1a7025d28a081561fcc52f01df4855fd163d/
> >         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/be86a7d9f05b44cae2e48ff7747df91c80bd1d65/
> Hi,
> 
> I presume these 3 are glitches in the host machine?

No. There are attempts of the autobuilder scripts to use a glibc
toolchain with a static library configuration, which isn't allowed by
Buildroot anymore. I have already handled a few of these cases in the
autobuilder scripts, but there are some more.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
