From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 11:25:33 +0200
Subject: [Buildroot] [PATCH] qemu: security bump to 2.12.1
In-Reply-To: <20181008070842.25883-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 8 Oct 2018 09:08:42 +0200")
References: <20181008070842.25883-1-peter@korsgaard.com>
Message-ID: <871s8j8xde.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 > This update contains new mitigation functionality for CVE-2018-3639
 > (Speculative Store Bypass) in x86. There are also bug fixes for
 > migration, Intel IOMMU emulation, block layer/image handling, ARM
 > emulation, and various other areas.

 > https://www.mail-archive.com/qemu-devel at nongnu.org/msg553574.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
