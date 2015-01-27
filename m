From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:13:12 +0100
Subject: [Buildroot] [PATCH] openssl: fix c_rehash dumbness
In-Reply-To: <1422394423-27700-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 27 Jan 2015 18:33:43 -0300")
References: <1422394423-27700-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y4onx47b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The new c_rehash from openssl 1.0.2 can't take a minus in the directory
 > string since the regex for matching commands checks for - in any
 > position instead of just the beginning to trigger the command parser. Fixes:
 > http://autobuild.buildroot.net/results/ee6/ee683569350d5deaf0ccc603ed7066bffb83cbe3/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
