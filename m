From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:05:45 +0100
Subject: [Buildroot] [PATCH] putty: security bump to version 0.71
In-Reply-To: <d3ffe9037b75e0b286b21564dd939f2d5fa1b4e9.1553455273.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 24 Mar 2019 21:21:13 +0200")
References: <d3ffe9037b75e0b286b21564dd939f2d5fa1b4e9.1553455273.git.baruch@tkos.co.il>
Message-ID: <87bm20q66e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2019-9894: A remotely triggerable memory overwrite in RSA key
 > exchange can occur before host key verification.

 > CVE-2019-9895: A remotely triggerable buffer overflow exists in any kind
 > of server-to-client forwarding.

 > CVE-2019-9897: Multiple denial-of-service attacks that can be triggered
 > by writing to the terminal.

 > CVE-2019-9898: Potential recycling of random numbers used in
 > cryptography.

 > Disable static build for now. When building statically configure defines
 > NO_GSSAPI. Build with NO_GSSAPI is currently broken. The issue has been
 > reported upstream.

 > Cc: Alexander Dahl <post@lespocky.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
