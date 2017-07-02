From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 17:12:28 +0200
Subject: [Buildroot] [PATCH] package/xen: Fix builds with GCC 7
In-Reply-To: <20170701124321.341c3c13@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 1 Jul 2017 12:43:21 +0200")
References: <20170629220922.7615-1-alistair.francis@xilinx.com>
 <20170701124321.341c3c13@windsurf.home>
Message-ID: <87a84mc1pf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 29 Jun 2017 15:09:22 -0700, Alistair Francis wrote:
 >> Fix a "duplicate 'const' declaration specifier" error that occurs when
 >> building Xen. As the issue has already been fixed in upstream Xen let's
 >> just backport the fix to apply here.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/3a0/3a03c328bc6a6c30cc4f619925608d735632211f/
 >> 
 >> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
 >> ---
 >> package/xen/0008-arm-fix-build-with-gcc-7.patch | 69 +++++++++++++++++++++++++
 >> 1 file changed, 69 insertions(+)
 >> create mode 100644 package/xen/0008-arm-fix-build-with-gcc-7.patch

Committed to 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
