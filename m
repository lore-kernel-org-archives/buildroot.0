From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 23:00:09 +0100
Subject: [Buildroot] [PATCH] pkg-infra: improve reliability of
	foo-install
In-Reply-To: <1327104072-6202-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 21 Jan 2012 01:01:12 +0100")
References: <1327104072-6202-1-git-send-email-arnout@mind.be>
Message-ID: <874nv899qu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Running foo-uninstall has a high likelyhood of failing, because we
 Arnout> remove a lot of directories from the target.  To improve the reliability,
 Arnout> remove the stamp files before calling the uninstall commands, and add
 Arnout> the -k option to the sub-make.

Committed, thanks.

-- 
Bye, Peter Korsgaard
