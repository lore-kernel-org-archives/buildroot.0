From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 14:23:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/patchelf: Pull in upstream
 bugfixes
In-Reply-To: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
 (Conrad Ratschan's message of "Mon, 5 Oct 2020 13:50:34 -0500")
References: <20201005185034.37131-1-conrad.ratschan@rockwellcollins.com>
Message-ID: <87a6w6jxhe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Conrad" == Conrad Ratschan <conrad.ratschan@rockwellcollins.com> writes:

 > On Buildroot 2020.02.6 when building iputils for powerpc with
 > BR2_PIC_PIE enabled, the arping/rdisc/tftpd binaries will segfault at
 > runtime. This can be traced back to a few bugs in patchelf corrupting
 > the ELFs when resizing the RPATH to replace "$ORIGIN/" with "/usr/sbin".

 > This patch pulls in upstream fixes to prevent the binaries from being
 > needlessly inflated, prevent the startPage from always being adjusted,
 > fix a few minor bugs, and fix incorrect endianness handling.

 > Signed-off-by: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
