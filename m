From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 23:27:01 +0200
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.17
In-Reply-To: <1445010876-13077-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 16 Oct 2015 12:54:36 -0300")
References: <1445010876-13077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oafy1p3u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-5291 - Remote attack on clients using session tickets or SNI

 > Also includes countermeasures against Lenstra's RSA-CRT attach for
 > PKCS#1 v1.5 signatures (1.2.16) and the Logjam attack (1.2.15).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
