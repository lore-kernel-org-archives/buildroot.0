From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Oct 2014 01:58:35 +0200
Subject: [Buildroot] [PATCH] Complain loudly if BR2_GLOBAL_PATCH_DIR
	does not exit
In-Reply-To: <1413880974-30138-1-git-send-email-sojka@merica.cz> (Michal
 Sojka's message of "Tue, 21 Oct 2014 10:42:54 +0200")
References: <1413880974-30138-1-git-send-email-sojka@merica.cz>
Message-ID: <87a94l6mvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michal" == Michal Sojka <sojka@merica.cz> writes:

 > If the BR2_GLOBAL_PATCH_DIR is misspelled in the .config or if somebody
 > renamed the existing directory with patches, buildroot happily builds
 > everything but without the patches. As this can lead to surprising
 > results, it is better to fail and give a user a message that
 > BR2_GLOBAL_PATCH_DIR is wrongly configured.

 > Signed-off-by: Michal Sojka <sojka@merica.cz>

Committed, thanks.

-- 
Bye, Peter Korsgaard
