From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:25:14 +0100
Subject: [Buildroot] [PATCH] kompexsqlite: needs threads and wchar
In-Reply-To: <1448032747-7558-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 20 Nov 2015 12:19:07 -0300")
References: <1448032747-7558-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87610pyawl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Wchar is used by the wrapper, fixes:
 > http://autobuild.buildroot.net/results/763/763d9aff86085b67077fc665e462cee81962246d/

 > Threads can be disabled by the sqlite build system, but since
 > kompexsqlite doesn't use the sqlite buildsystem and only uses a bundled
 > version it falls back to the default for *nixes (enabled), fixes:
 > http://autobuild.buildroot.net/results/c0b/c0b65be99603a2c2f07a38078f6b5622353915ca/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
