From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:11:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/stunnel: security bump to
 version 5.55
In-Reply-To: <1562877806-10215-1-git-send-email-pjtexier@koncepto.io>
 (Pierre-Jean Texier's message of "Thu, 11 Jul 2019 22:43:25 +0200")
References: <1562877806-10215-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <87ftn97wnn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pierre-Jean" == Pierre-Jean Texier <pjtexier@koncepto.io> writes:

 > See https://www.stunnel.org/ChangeLog.md.html

Which lists:

Security bugfixes

- Fixed a Windows local privilege escalation vulnerability caused
  insecure OpenSSL cross-compilation defaults. Successful exploitation
  requires stunnel to be deployed as a Windows service, and
  user-writable C:\ folder. This vulnerability was discovered and
  reported by Rich Mirch.

- OpenSSL DLLs updated to version 1.1.1c.

So those do not affect Buildroot targets, and I have dropped "security"
from the subject and committed, thanks.

-- 
Bye, Peter Korsgaard
