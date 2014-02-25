From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 21:20:37 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: rework .config file editing
In-Reply-To: <1391524759-3371-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Tue, 4 Feb 2014 15:39:19 +0100")
References: <1391524759-3371-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87txbnhrl6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > From: Sven Neumann <s.neumann@raumfeld.com>
 > Do all substitutions on the .config file in a single sed command.
 > Make the .config file editing a lot more readable. Based on ideas
 > brought up by Arnout Vandecappelle on the mailing-list.

 > Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >  (build-test with all features enabled)
 > [Samuel: rebase on head of master]
 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
