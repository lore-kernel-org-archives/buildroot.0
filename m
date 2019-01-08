From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Jan 2019 16:05:15 +0100
Subject: [Buildroot] [PATCH] efibootmgr: drop unneeded include path
 workaround
In-Reply-To: <20190107085702.7771-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 7 Jan 2019 09:57:02 +0100")
References: <20190107085702.7771-1-peter@korsgaard.com>
Message-ID: <87pnt7dwb8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The hard coded -I/usr/include/efivar has been dropped from the Makefile in
 > commit 000eb0020c02 (Set pkg-config binary as variable) which is part of
 > v13, so drop the unneeded (misnamed) EFIBOOTMSR_PATCH_HEADER_PATH workaround.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
