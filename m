From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:20:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 4.7.0
In-Reply-To: <20210306161450.2424523-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Mar 2021 17:14:50 +0100")
References: <20210306161450.2424523-1-fontaine.fabrice@gmail.com>
Message-ID: <87k0q6yc4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-3336: DoTls13CertificateVerify in tls13.c in wolfSSL before
 > 4.7.0 does not cease processing for certain anomalous peer behavior
 > (sending an ED22519, ED448, ECC, or RSA signature without the
 > corresponding certificate). The client side is affected because
 > man-in-the-middle attackers can impersonate TLS 1.3 servers.

 > https://github.com/wolfSSL/wolfssl/releases/tag/v4.7.0-stable

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
