From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 11:40:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/libressl: security bump to
 version 3.2.3
In-Reply-To: <20201213091718.65909-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 13 Dec 2020 10:17:18 +0100")
References: <20201213091718.65909-1-fontaine.fabrice@gmail.com>
Message-ID: <87wnxmxa47.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > It includes the following security fix:
 >  * Malformed ASN.1 in a certificate revocation list or a timestamp
 >    response token can lead to a NULL pointer dereference.

 > https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.2.3-relnotes.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

For 2020.02.x / 2020.08.x, I will instead bump to 3.1.5, which has the
same fix.

-- 
Bye, Peter Korsgaard
