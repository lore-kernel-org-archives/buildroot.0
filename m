From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 21:15:54 +0200
Subject: [Buildroot] [PATCH] subversion: security bump to version 1.9.4
In-Reply-To: <1461868123-1547-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 28 Apr 2016 15:28:43 -0300")
References: <1461868123-1547-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mvodwnmd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-2167 - svnserve/sasl may authenticate users using the wrong
 > realm.
 > CVE-2016-2168 - Remotely triggerable DoS vulnerability in mod_authz_svn
 > during COPY/MOVE authorization check.

Committed, thanks.

-- 
Bye, Peter Korsgaard
