From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 22:49:10 +0100
Subject: [Buildroot] [PATCH] package/libssh2: security bump to latest git
In-Reply-To: <20190320211859.18155-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 20 Mar 2019 22:18:59 +0100")
References: <20190320211859.18155-1-peter@korsgaard.com>
Message-ID: <87ftr8q97t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bump the version to latest git to fix the following security issues:
 > CVE-2019-3855
 >  Possible integer overflow in transport read allows out-of-bounds write
 >  URL: https://www.libssh2.org/CVE-2019-3855.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3855.patch

 > CVE-2019-3856
 >  Possible integer overflow in keyboard interactive handling allows
 >  out-of-bounds write
 >  URL: https://www.libssh2.org/CVE-2019-3856.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3856.patch

 > CVE-2019-3857
 >  Possible integer overflow leading to zero-byte allocation and out-of-bounds
 >  write
 >  URL: https://www.libssh2.org/CVE-2019-3857.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3857.patch

 > CVE-2019-3858
 >  Possible zero-byte allocation leading to an out-of-bounds read
 >  URL: https://www.libssh2.org/CVE-2019-3858.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3858.patch

 > CVE-2019-3859
 >  Out-of-bounds reads with specially crafted payloads due to unchecked use of
 >  `_libssh2_packet_require` and `_libssh2_packet_requirev`
 >  URL: https://www.libssh2.org/CVE-2019-3859.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3859.patch

 > CVE-2019-3860
 >  Out-of-bounds reads with specially crafted SFTP packets
 >  URL: https://www.libssh2.org/CVE-2019-3860.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3860.patch

 > CVE-2019-3861
 >  Out-of-bounds reads with specially crafted SSH packets
 >  URL: https://www.libssh2.org/CVE-2019-3861.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3861.patch

 > CVE-2019-3862
 >  Out-of-bounds memory comparison
 >  URL: https://www.libssh2.org/CVE-2019-3862.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3862.patch

 > CVE-2019-3863
 >  Integer overflow in user authenicate keyboard interactive allows
 >  out-of-bounds writes
 >  URL: https://www.libssh2.org/CVE-2019-3863.html
 >  Patch: https://libssh2.org/1.8.0-CVE/CVE-2019-3863.txt

 > Drop 0003-openssl-fix-dereferencing-ambiguity-potentially-caus.patch as that
 > is now upstream.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
