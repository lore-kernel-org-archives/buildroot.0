From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 May 2017 21:24:35 +0200
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <20170507153843.529dc316@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 7 May 2017 15:38:43 +0200")
References: <20170507145548.336e29ad@free-electrons.com>
 <20170507153843.529dc316@free-electrons.com>
Message-ID: <877f1sqxl8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Cloning from http:// also fails:

 >>>> linux rel_imx_4.1.15_2.0.0_ga Downloading
 > Doing shallow clone
 > Cloning into 'linux-rel_imx_4.1.15_2.0.0_ga'...
 > fatal: dumb http transport does not support --depth
 > Shallow clone failed, falling back to doing a full clone
 > Doing full clone
 > Cloning into 'linux-rel_imx_4.1.15_2.0.0_ga'...
 > Checking connectivity... done.
 > warning: remote HEAD refers to nonexistent ref, unable to checkout.

 > Could not fetch special ref 'rel_imx_4.1.15_2.0.0_ga'; assuming it is not special.

 > While the tag rel_imx_4.1.15_2.0.0_ga clearly exists in
 > http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/.

 > Peter: as a temporary fix, could you put
 > http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/snapshot/linux-imx-rel_imx_4.1.15_2.0.0_ga.tar.gz
 > in http://sources.buildroot.net ? Thanks!

Done! (earlier today).

-- 
Bye, Peter Korsgaard
