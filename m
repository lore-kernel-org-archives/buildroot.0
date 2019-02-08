From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Feb 2019 22:42:19 +0100
Subject: [Buildroot] [PATCH] package/libopenssl: m68x use
 SMALL_FOOTPRINT mode
In-Reply-To: <1549651619-2551-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Fri, 8 Feb 2019 12:46:59 -0600")
References: <1549651619-2551-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <8736oyyn2c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > OPENSSL_SMALL_FOOTPRINT mode selects alternate paths in the sha512 and
 > blake2 algorithms which resolves a assembler issue like the following.

 > /tmp/ccfnLhKQ.s: Assembler messages:
 > /tmp/ccfnLhKQ.s:11167: Error: value -32790 out of range
 > make[2]: *** [crypto/blake2/blake2b.o] Error 1

 > This issue was found after the OpenSSL1.1.x bump.

 > Fixes
 > http://autobuild.buildroot.net/results/533e817695cde321b725145112cfd83c092d9d75

 > Upstream ticket
 > https://github.com/openssl/openssl/issues/8190

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
