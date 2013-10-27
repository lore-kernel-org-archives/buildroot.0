From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Oct 2013 15:31:24 +0100
Subject: [Buildroot] [PATCH v2] Update config.guess and config.sub
	scripts to latest versions.
In-Reply-To: <1382881879-18169-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 27 Oct 2013 14:51:19 +0100")
References: <1382874665-4711-1-git-send-email-arnout@mind.be>
 <1382881879-18169-1-git-send-email-arnout@mind.be>
Message-ID: <87wqkyu6o3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > From: Jouko Nikula <jouko.nikula@espotel.com>
 > Current version of config.guess may fail to detect host libc version,
 > which results in problems with configure when building gcc. Current patches
 > are removed. Patch to add support for ps2 is removed as it was discussed on
 > buildroot mailing list that it is no longer needed.

 > [Arnout: drop the 'improve uClibc' patch, update commit message, update to
 > more recent version, update README.]
 > Signed-off-by: Jouko Nikula <jouko.nikula@espotel.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > v3: Now actually update the config.guess as well. And while I'm at
 >     it, I've also updated to the current latest git version of gnuconfig.

 >     Also I reset the Author to Jouko now.

Committed, thanks.

-- 
Bye, Peter Korsgaard
