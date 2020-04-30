From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:37:38 +0200
Subject: [Buildroot] [git commit] package/libcoap: properly enable DTLS
 support
In-Reply-To: <20200412200439.6473B8E82F@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Apr 2020 22:08:47 +0200")
References: <20200412200439.6473B8E82F@busybox.osuosl.org>
Message-ID: <87y2qd5eul.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8b14f6b49b962d4d8f7135d85afa15658ea8f94b
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The DTLS support needs either gnutls or openssl, so let's have these
 > packages as optional dependencies. We prefer gnutls over openssl as
 > done by upstream in their configure.ac when the user does not provide
 > any option (which is the case currently)

 > While there is support for tinydtls, and Buildroot has a tinydtls
 > package, libcoap is only able to use its own internal library, and
 > only when static linking is enabled, so we simply disable the use of
 > tinydtls altogether.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
