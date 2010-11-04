From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Nov 2010 19:28:16 +0100
Subject: [Buildroot] [PATCH 1/1] Remove INITRAMFS_TARGET variable
In-Reply-To: <ba1423a20cd11aadc3ab175bf5710a1a763bf544.1288887683.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 4 Nov 2010 17:21:28 +0100")
References: <cover.1288887683.git.thomas.petazzoni@free-electrons.com>
	<cover.1288887683.git.thomas.petazzoni@free-electrons.com>
	<ba1423a20cd11aadc3ab175bf5710a1a763bf544.1288887683.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87iq0d6j0f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This used to be needed when the filesystem code was rewritten,
 Thomas> but not the Linux compilation code. Now that the Linux
 Thomas> compilation code has been rewritten, the mechanism to ensure
 Thomas> that initramfs gets built *before* the kernel so that it can be
 Thomas> integrated is different, and this INITRAMFS_TARGET variable is
 Thomas> no longer used.

Committed, thanks.

-- 
Bye, Peter Korsgaard
