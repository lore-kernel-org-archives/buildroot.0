From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 11:34:46 +0200
Subject: [Buildroot] [git commit] package/glib-networking: security bump
 to version 2.62.4
In-Reply-To: <20200601203817.3B9CB814C4@busybox.osuosl.org> (Peter Korsgaard's
 message of "Mon, 1 Jun 2020 22:37:50 +0200")
References: <20200601203817.3B9CB814C4@busybox.osuosl.org>
Message-ID: <87o8q1dd55.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8f3d361f5ccbb43270f9e69bf6ac472698d3722e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > - Fix CVE-2020-13645: In GNOME glib-networking through 2.64.2, the
 >   implementation of GTlsClientConnection skips hostname verification of
 >   the server's TLS certificate if the application fails to specify the
 >   expected server identity. This is in contrast to its intended
 >   documented behavior, to fail the certificate verification.
 >   Applications that fail to provide the server identity, including Balsa
 >   before 2.5.11 and 2.6.x before 2.6.1, accept a TLS certificate if the
 >   certificate is valid for any host.
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > [Peter: bump to 2.62.4 rather than 2.64.3]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
