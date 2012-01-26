From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jan 2012 15:42:04 +0100
Subject: [Buildroot] [RFC] Support libraries for TI OMAP and DaVinci DSP
	accelerators
In-Reply-To: <1327251861-16833-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 22 Jan 2012 18:04:21 +0100")
References: <1327251861-16833-1-git-send-email-arnout@mind.be>
Message-ID: <87sjj234qr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

Hi,

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> This (huge) patch adds the support libraries for OMAP and DaVinci
 Arnout> processors to buildroot.  This is an RFC: there are still a bunch
 Arnout> of FIXMEs and I've only tried it on a DM365.  I post it as one
 Arnout> big patch this time, so it is easier to see the overall structure.

 Arnout> As I said, it is far from ready.  However, it has been sitting
 Arnout> in my repository for more than two months now and I haven't had
 Arnout> time to improve it.  So I thought it would be better to post it
 Arnout> now, unfinished, rather than risking that it becomes unusable.

Thanks! Lets discuss some more about it during the dev day. I'm starting
a TI-based project at work at the moment, and I've takend a quick look
at the powervr situation, which is a similar mess.

-- 
Bye, Peter Korsgaard
