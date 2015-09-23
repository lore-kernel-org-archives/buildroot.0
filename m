From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Sep 2015 23:14:24 +0200
Subject: [Buildroot] [PATCH] openssl: change sed expression delimiter
In-Reply-To: <1442931820-20838-1-git-send-email-gustavo.zacarias@free-electrons.com>
 (gustavo zacarias's message of "Tue, 22 Sep 2015 11:23:40 -0300")
References: <1442931820-20838-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <87twqkq1n3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > Switch from : to # since CFLAGS can include :'s spilled in from
 > BR2_TARGET_OPTIMIZATION, for example:

 > BR2_TARGET_OPTIMIZATION="-Wl,-rpath,/lib:/usr/lib" would cause the sed
 > expression to fail thus breaking the build.

 > Changed all of the SEDs to # for consistency.

 > Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
