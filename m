From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 14:00:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-01-16
In-Reply-To: <20180117120824.46377330@x230.trabucayre.com>
References: <20180117070031.EC9E0208EE@mail.free-electrons.com>
 <20180117120824.46377330@x230.trabucayre.com>
Message-ID: <20180117140014.6cdf1339@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 12:08:24 +0100, Gwenhael Goavec-Merou wrote:

> >        nios2 |             python-pyqt-4.11.3 |
> > http://autobuild.buildroot.net/results/4757f76e56240302cbccf2d460493d13eefb0e56
> > 
> > -- 
> > http://autobuild.buildroot.net  
> 
> It's strange I have this result instead of the build failure mentioned
> in the log :

Strange, not necessarily. Remember that the autobuilder tests are done
on various machines, that have various distributions/configurations. So
sometimes we have build failures occurring on a particular machine, and
not on others, due to influences of the host system.

Other than that, the fact that it fails for you means that you have two
problems for the price of one :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
