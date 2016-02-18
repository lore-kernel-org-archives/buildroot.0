From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Feb 2016 09:41:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump for
	0.10.x to version 0.10.42
In-Reply-To: <1455782706-8599-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Thu, 18 Feb 2016 09:05:06
 +0100")
References: <1455782706-8599-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <871t8axvet.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Fixes security vulnerabilites [1]:
 >  - CVE-2016-2086
 >  - CVE-2016-2216

 > Also switch to the xz compressed tar file now available for v0.10 builds from
 > v0.10.42 onward.

 > [1] https://nodejs.org/en/blog/vulnerability/february-2016-security-releases/

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
