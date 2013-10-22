From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 23:59:18 +0200
Subject: [Buildroot] [PATCH] nano: fix ncursesw build failure
In-Reply-To: <1382380195-7094-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 21 Oct 2013 15:29:55 -0300")
References: <1382380195-7094-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ppqx9dc9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > After the latest version bump ncursesw5-config is automatically detected
 > if it's present in the build machine (almost always because we need full
 > ncurses support with headers for Kconfig's menuconfig).
 > Since we don't have ncursesw support in buildroot just say no. Fixes:
 > http://autobuild.buildroot.net/results/89d/89d7ec7306411b15f9ffbc2051d0d316237b4c07/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
