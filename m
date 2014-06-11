From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 12:50:26 +0200
Subject: [Buildroot] [PATCH] dhcp: bump to version 4.1-ESV-R9
In-Reply-To: <1402483179-17307-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Jun 2014 07:39:39 -0300")
References: <1402483179-17307-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761k7k9e5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Also install the SysV initscripts from the proper hook.
 > Since the scripts check for the proper files to be present there's no
 > need to exclude them according to options since they won't try to start
 > anything.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
