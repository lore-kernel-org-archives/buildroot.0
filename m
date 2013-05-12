From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 21:30:31 +0200
Subject: [Buildroot] [PATCH] czmq: disable asciidoc documentation
	generation
In-Reply-To: <1368386152-27165-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 12 May 2013 21:15:52 +0200")
References: <1368386152-27165-1-git-send-email-arnout@mind.be>
Message-ID: <87txm8xag8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> czmq uses asciidoc for its documentation. asciidoc uses python
 Arnout> and import the unicodedata module, which is not in
 Arnout> host-python. So disable asciidoc entirely.

 Arnout> This doesn't get hit by the autobuilders because they don't
 Arnout> have asciidoc installed in their chroot.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
