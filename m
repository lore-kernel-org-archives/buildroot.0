From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 12:50:03 +0200
Subject: [Buildroot] [PATCH 1/5] dash: bump to version 0.5.8-1
In-Reply-To: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 10:19:45 -0300")
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3ydzhno.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add hash file, make the /bin/sh -> dash symlink and build after busybox and
 > use $(INSTALL) instead of cp for proper mode handling.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed with the /bin/sh handling removed as we'll handle it globally
instead, thanks.

-- 
Bye, Peter Korsgaard
