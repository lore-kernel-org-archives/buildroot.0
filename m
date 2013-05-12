From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 21:31:14 +0200
Subject: [Buildroot] [PATCH] filemq: disable asciidoc documentation
	generation
In-Reply-To: <1368386701-5188-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 12 May 2013 21:25:01 +0200")
References: <1368386701-5188-1-git-send-email-arnout@mind.be>
Message-ID: <87li7kxaf1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> filemq uses asciidoc for its documentation. asciidoc uses
 Arnout> python and import the unicodedata module, which is not in
 Arnout> host-python. So disable asciidoc entirely.

 Arnout> This doesn't get hit by the autobuilders because they don't
 Arnout> have asciidoc installed in their chroot.

Committed, thanks.

-- 
Bye, Peter Korsgaard
