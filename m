From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Dec 2012 17:22:11 -0800
Subject: [Buildroot] [PATCH] unexport PKG_CONFIG_SYSROOT_DIR
In-Reply-To: <1354482784-31167-1-git-send-email-cdhmanning@gmail.com> (Charles
 Manning's message of "Mon, 3 Dec 2012 10:13:04 +1300")
References: <1354482784-31167-1-git-send-email-cdhmanning@gmail.com>
Message-ID: <87r4n853r0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Manning <cdhmanning@gmail.com> writes:

 Charles> If this is not done then pkg-config can get confused.
 Charles> Thomas and Arnout really deserve the credit for this - I just did
 Charles> the testing.

Committed, thanks.

-- 
Bye, Peter Korsgaard
