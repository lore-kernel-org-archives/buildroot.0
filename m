From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 May 2013 11:14:58 +0200
Subject: [Buildroot] [PATCH] Revert "dependencies: check that SSL
	certificates are installed"
In-Reply-To: <1369031247-2075-1-git-send-email-baruch@tkos.co.il> (Baruch
 Siach's message of "Mon, 20 May 2013 09:27:27 +0300")
References: <1369031247-2075-1-git-send-email-baruch@tkos.co.il>
Message-ID: <87txlqf6gd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> This reverts commit d66cd067f3dc3d5e2479e1e8c05f24fd82329f7a.

 Baruch> SSL certificates are no always installed in /etc/ssl/certs. For
 Baruch> example, on CentOS 5.6 the default OpenSSL certificates
 Baruch> directory is /etc/pki/tls/certs, and wget can download using
 Baruch> https without any problem.

 Baruch> Moreover, the existence of /etc/ssl/certs does not guarantee
 Baruch> the presence of a CA certificates bundle even on Debian. On my
 Baruch> current Debian testing installation the openssl package itself
 Baruch> creates an empty /etc/ssl/certs directory.

Committed, thanks.

-- 
Bye, Peter Korsgaard
