From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 19 Sep 2010 12:05:05 +0200
Subject: [Buildroot] [PATCH 19/21] openssl: bump to 1.0.0a
In-Reply-To: <1284864823-18993-20-git-send-email-Martin.Banky@gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
	<1284864823-18993-20-git-send-email-Martin.Banky@gmail.com>
Message-ID: <4C95E051.4010507@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 19.09.2010 04:53, schrieb Martin Banky:
> Signed-off-by: Martin Banky<Martin.Banky@gmail.com>
> ---
> [...]
Hi Martin,

Again just my comments about new openssl.

Somewhere I read, that openssl 1.0 is not in all cases compatible to 
openssl 0.9.8.
Some package combinations need to have both versions installed in parallel.
Maybe it is to early to upgrade to 1.0 as a complete replacement for 0.9 ->
- we can wait until all upstream packages are able to cope with 1.0 (I 
don't know which are working fine and which need former version)
- provide both versions (1.0 and 0.9) in parallel
- maybe it is safe to replace 0.9 with 1.0 - but who will make the test 
with all userland packages...?

Just my thoughts about it...


Regards,
Marcus
