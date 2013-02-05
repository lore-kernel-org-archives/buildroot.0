From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 21:38:30 +0100
Subject: [Buildroot] [PATCH 3/4] busybox: busybox-update-config should
	depend on busybox-configure
In-Reply-To: <906319b949f250124fdd06ea6bf4ac3b44337903.1360084128.git.arnout@mind.be>
 (Arnout Vandecappelle's message of "Tue, 5 Feb 2013 18:16:01 +0100")
References: <cover.1360084128.git.arnout@mind.be>
 <cover.1360084128.git.arnout@mind.be>
 <906319b949f250124fdd06ea6bf4ac3b44337903.1360084128.git.arnout@mind.be>
Message-ID: <87zjzio5rt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Before the config file can be copied, it has to exist.  The
 Arnout> other xxx-update-config targets do this as well.

Committed, thanks.

-- 
Bye, Peter Korsgaard
