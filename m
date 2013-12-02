From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Dec 2013 11:33:13 +0100
Subject: [Buildroot] [PATCH] lighttpd: apply security patches for
	lighttpd-1.4.33
In-Reply-To: <1385967101.8380.1.camel@phoenix> (Axel Lin's message of "Mon, 02
 Dec 2013 14:51:41 +0800")
References: <1385967101.8380.1.camel@phoenix>
Message-ID: <8761r7sfti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Apply security patches for lighttpd-1.4.33.
 > Also rename these patches to follow buildroot's naming scheme.

 > lighttpd-03-fix_fam_use_after_free.patch:
 > http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.33_fix_fam_use_after_free.patch

 > lighttpd-04-fix_setuid.patch:
 > http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.33_fix_setuid.patch

 > lighttpd-05-fix_ssl_sni.patch:
 > http://download.lighttpd.net/lighttpd/security/lighttpd-1.4.33_fix_ssl_sni.patch

 > Signed-off-by: Axel Lin <axel.lin@ingics.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
