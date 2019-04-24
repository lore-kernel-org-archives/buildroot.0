From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:20:24 +0200
Subject: [Buildroot] [PATCH 1/1] [v2] package/freerdp: bump version to
 2.0.0-rc4
In-Reply-To: <20190407190629.5380-1-skif@skif-web.ru> (Alexey Lukyanchuk's
 message of "Sun, 7 Apr 2019 22:06:29 +0300")
References: <20190407190629.5380-1-skif@skif-web.ru>
Message-ID: <87r29rb47b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Lukyanchuk <skif@skif-web.ru> writes:

 > Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
 > Add support to set tls security level (for openssl >= 1.1.0), for RDP
 > protocol version 10(needed for windows 10 and windows server 2016). Also have some fix and features, see
 > https://github.com/FreeRDP/FreeRDP/commit/e21b72c95f857817b4b32b5ef5406355c005a9e8

 > Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>

Committed to 2019.02.x after extending the commit message to mention the
security fixes this includes, thanks.

-- 
Bye, Peter Korsgaard
