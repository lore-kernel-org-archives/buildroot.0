From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Apr 2012 15:48:25 +0200
Subject: [Buildroot] [PATCH] neon: fix help text for
	BR2_PACKAGE_NEON_NOXML
In-Reply-To: <1334698170-30152-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 17 Apr 2012 23:29:30 +0200")
References: <1334698170-30152-1-git-send-email-arnout@mind.be>
Message-ID: <87vckvn87q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Commit 4fbff28b removed the 'depends on' statements for the XML
 Arnout> choice.  Therefore, the expat and libxml2 options are always
 Arnout> available.  Remove the cryptic part of help text that tells you
 Arnout> to select something if it is not available.

Committed, thanks.

-- 
Bye, Peter Korsgaard
