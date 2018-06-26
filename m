From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:23:40 +0200
Subject: [Buildroot] [PATCH v2,1/1] qt5base: fix license
In-Reply-To: <20180618213620.22387-1-fontaine.fabrice@gmail.com>
References: <20180618213620.22387-1-fontaine.fabrice@gmail.com>
Message-ID: <20180626232340.4625a890@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jun 2018 23:36:20 +0200, Fabrice Fontaine wrote:
> - Since QT 5.11, LICENSE.GPLv3 doesn't exist anymore so use LICENSE.GPL3
>   and add its hash
> - Update hash of LICENSE.LGPLv3 (as it now makes a reference to
>   LICENSE.GPL3 instead of LICENSE.GPLv3)
> - Update hash of header.BSD (year is now YYYY instead of 2016)
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/b8add9b9a2defe5e64330714e9768ffa6393adc0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Update hashes for LICENSE.LGPLv3 and header.BSD
>  - Remove hash of LICENSE.GPLv3

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
