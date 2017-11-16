From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Nov 2017 15:34:52 +0100
Subject: [Buildroot] [PATCH v3] uboot-tools: disable pylibfdt
In-Reply-To: <20171101171849.7957-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 1 Nov 2017 12:18:49 -0500")
References: <20171101171849.7957-1-matthew.weber@rockwellcollins.com>
Message-ID: <87y3n69trn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Using concepts from the future upstream fix (post 2017.11),
 > which sets up a kconfig variable for pylibfdt and
 > conditionally enables the swig wrapper creation (default=n).
 > (https://patchwork.ozlabs.org/patch/826742/)
 > (https://patchwork.ozlabs.org/patch/826752/)

 > This does not disable the use of the swig wrapper directly with
 > the version of u-boot being used. The uboot package still has
 > the BR2_TARGET_UBOOT_NEEDS_PYLIBFDT option to enable this feature.

 > Fixes (one of many):
 > http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 > --
 > Changes
 > v2 -> v3
 >  - Moved from removing the swig and python to instead following
 >    the pattern of the future changes captured in this patchset
 >    to expose it through kconfig.
 >    (https://lists.denx.de/pipermail/u-boot/2017-October/309560.html)

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
