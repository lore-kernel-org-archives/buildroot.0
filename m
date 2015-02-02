From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Feb 2015 18:29:51 +0100
Subject: [Buildroot] [PATCH 2/3] alsa-lib: Force arm mode instead of
	Thumb1 mode
In-Reply-To: <54CFB1E2.4010809@mind.be> (Arnout Vandecappelle's message of
 "Mon, 02 Feb 2015 18:20:34 +0100")
References: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
 <1421753079-27665-2-git-send-email-richard.genoud@gmail.com>
 <54CFB1E2.4010809@mind.be>
Message-ID: <87vbjkgr1s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 20/01/15 12:24, Richard Genoud wrote:
 >> alsa-lib has some assembly that doesn't exist in thumb1 mode.
 >> So, force arm mode for alsa-lib.
 >> 
 >> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > However, I can't find the assembly that you refer to. And of course
 > this problem only becomes apparent at runtime.

Me neither. It builds fine here in thumb1 mode. Richard, what problem
did you see exactly?

-- 
Bye, Peter Korsgaard
