From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Dec 2013 13:52:56 +0100
Subject: [Buildroot] [PATCH] ulogd: link conditionally to libpthread
In-Reply-To: <1386678209-6815-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 10 Dec 2013 09:23:29 -0300")
References: <1386678209-6815-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2l46f6f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > libpthread is only needed for the database backends so don't link
 > against it if it's not available.

 > Fixes:
 > http://autobuild.buildroot.net/results/527/527d9d4f42af0ffc110e4f52701df279f466a89a/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
