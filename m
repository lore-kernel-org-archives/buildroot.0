From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 16:59:37 +0200
Subject: [Buildroot] [PATCH v2] boot/xloader: remove package
In-Reply-To: <1537480464-50744-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 20 Sep 2018 16:54:24 -0500")
References: <1537480464-50744-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87a7n04uue.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > U-boot has provided SPL support as a viable replacement for the
 > 2nd stage bootloader on TI platforms.  The X-loader project
 > hasn't had a commit in the log since 12-05-2011.
 > (https://gitorious.org/x-loader/x-loader)

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v1 -> v2
 > [Thomas
 >  - added Config.in.legacy entry

Committed, thanks.

-- 
Bye, Peter Korsgaard
