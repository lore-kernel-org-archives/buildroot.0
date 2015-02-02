From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Feb 2015 21:42:36 +0100
Subject: [Buildroot] [PATCH 3/3] qt: Force arm mode instead of Thumb1
	mode
In-Reply-To: <1421753079-27665-3-git-send-email-richard.genoud@gmail.com>
 (Richard Genoud's message of "Tue, 20 Jan 2015 12:24:39 +0100")
References: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
 <1421753079-27665-3-git-send-email-richard.genoud@gmail.com>
Message-ID: <87r3u8gi4j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Genoud <richard.genoud@gmail.com> writes:

 > Qt has some assembly that doesn't exist in thumb1 mode.
 > So, force arm mode for Qt

 > Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
