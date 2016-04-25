From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 17:04:10 +0200
Subject: [Buildroot] QMAKESPEC has not been set
In-Reply-To: <cbbb11e2c7e662c45ad8c288e9f113d8@rtsys.fr>
References: <cbbb11e2c7e662c45ad8c288e9f113d8@rtsys.fr>
Message-ID: <20160425170410.394d5384@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Apr 2016 14:31:12 +0200, rfinkelstein at rtsys.fr wrote:
> Hello, I am using Buildroot 2016.02.
> 
> I'm trying to build the package python-pyqt5, to do so the package 
> python-sip 4.16.7 is selected,

We don't have a package called python-pyqt5 in Buildroot, we only have
python-pyqt which is for Qt4 only.

So I'm not sure how to help you, since you're using packages that are
not in Buildroot, and not even posting the corresponding patches for
those packages, or giving the Buildroot configuration that produces the
problem.

Could you give more details?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
