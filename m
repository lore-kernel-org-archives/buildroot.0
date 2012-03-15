From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 10:44:48 +0100
Subject: [Buildroot] [PATCHv2] ext-toolchain: Automatically set -m64 if
	the architecture is x86_64
In-Reply-To: <201203150917.03355.arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 15 Mar 2012 09:17:02 +0100")
References: <1331677800-3777-1-git-send-email-arnout@mind.be>
 <871uoukcrp.fsf@macbook.be.48ers.dk>
 <201203150917.03355.arnout@mind.be>
Message-ID: <87sjharyen.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> You have some whitespace damage here, but otherwise it looks good

 Arnout> Those were supposed to be whitespace fixes - tab + 2 spaces,
 Arnout> right?

Yes, but you also had:

+	  Other architecture variants (beyond Pentium-4/Xeon) are
+	  supported as well, but glibc is not optimised for it.
+            

(13 spaces on the last empty line).

-- 
Bye, Peter Korsgaard
