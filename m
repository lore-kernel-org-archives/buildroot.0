From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2014 22:50:46 +0100
Subject: [Buildroot] [PATCH] beecrypt: make a config option for C++
	support
In-Reply-To: <1395855654-13145-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 26 Mar 2014 18:40:54 +0100")
References: <1395855654-13145-1-git-send-email-arnout@mind.be>
Message-ID: <874n2kk4sp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > beecrypt used to pull in icu automatically when C++ support was enabled,
 > but since icu is pretty large and slow, that automatic dependency was
 > removed.  However, it is not obvious to the user that he should enable
 > icu in order to get C++ support in beecrypt. Therefore, make the C++
 > support a user visible config option and mention icu in the help text.

 > It would also be possible to automatically enable C++ support if icu
 > happens to be selected for another reason, but that doesn't really seem
 > to offer an advantage.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
