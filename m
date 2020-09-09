From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 22:31:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to
 version 3.6.15
In-Reply-To: <20200905205353.1641544-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 5 Sep 2020 22:53:53 +0200")
References: <20200905205353.1641544-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2li4rqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libgnutls: Fixed "no_renegotiation" alert handling at incorrect timing.
 > The server sending a "no_renegotiation" alert in an unexpected timing,
 > followed by an invalid second handshake was able to cause a TLS 1.3
 > client to crash via a null-pointer dereference. The crash happens in the
 > application's error handling path, where the gnutls_deinit function is
 > called after detecting a handshake failure (#1071).
 > [GNUTLS-SA-2020-09-04, CVSS: medium]

 > https://lists.gnupg.org/pipermail/gnutls-help/2020-September/004669.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
