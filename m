From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:44:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtomcrypt: add security patch
 for CVE-2019-17362
In-Reply-To: <20191223150338.20370-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Mon, 23 Dec 2019 16:03:37 +0100")
References: <20191223150338.20370-1-patrickdepinguin@gmail.com>
Message-ID: <87pngcqdw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > CVE-2019-17362:
 > "The der_decode_utf8_string function (in der_decode_utf8_string.c) does not
 > properly detect certain invalid UTF-8 sequences.  This allows
 > context-dependent attackers to cause a denial of service (out-of-bounds read
 > and crash) or read information from other memory locations via carefully
 > crafted DER-encoded data."

 > Details:
 > https://github.com/libtom/libtomcrypt/issues/507
 > https://nvd.nist.gov/vuln/detail/CVE-2019-17362

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
