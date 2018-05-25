From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 May 2018 19:04:49 +0200
Subject: [Buildroot] [PATCH] package/bash-completion: fix a parallel
 build issue
In-Reply-To: <1527263926-26561-1-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Fri, 25 May 2018 17:58:46 +0200")
References: <1527263926-26561-1-git-send-email-romain.naour@smile.fr>
Message-ID: <87o9h38y4u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The STAGING_DIR/usr/share/bash-completion/completions directory is not
 > created yet.

 > Fixed by:
 > https://github.com/scop/bash-completion/commit/ee6b37ad7ff5b309cbb9b886a871252abd9398fa

 > Fixes:
 > http://autobuild.buildroot.org/results/7ee/7eea0f512695605714cf2d8c971778d4784b4c75/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
