From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 23:32:49 +0100
Subject: [Buildroot] [PATCH 1/2] ncurses: fix gpm support
In-Reply-To: <1418680812-24778-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 15 Dec 2014 19:00:11 -0300")
References: <1418680812-24778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3w0k0ha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The CF_LIB_SONAME macro doesn't work when cross compiling so we need to
 > specify the lib name for libgpm explicitly. While at it make gpm support
 > explicit in the form of --without-gpm when it's not selected and adding
 > it to dependencies when it is. Fixes:
 > http://autobuild.buildroot.net/results/32a/32a5ba3905772a3f2f2ec9d1b290a109fe22d9f9/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
