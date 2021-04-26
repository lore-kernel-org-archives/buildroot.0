From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 20:58:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnpupnp: security bump to
 version 4.1.4
In-Reply-To: <20210422075016.91908-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Thu, 22 Apr 2021 07:50:16 +0000")
References: <20210422075016.91908-1-joerg.krause@embedded.rocks>
Message-ID: <87zgxkhnym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Fix vulnerability to DNS-rebind attacks.
 > This security fix addresses the same vulnerability isue which was reported
 > for libupnp (which libnpupnp is derived from) in CVE-2021-29462.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
