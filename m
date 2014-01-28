From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:58:02 +0100
Subject: [Buildroot] [PATCH 5/5] fs: ensure $(TARGET_DIR_WARNING_FILE)
	is writable
In-Reply-To: <be9f56b1fa250b4860de767e4c118980796732d8.1390939719.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 28 Jan 2014 21:11:25 +0100")
References: <cover.1390939719.git.yann.morin.1998@free.fr>
 <be9f56b1fa250b4860de767e4c118980796732d8.1390939719.git.yann.morin.1998@free.fr>
Message-ID: <87txcnzs45.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > If the Buildroot tree is read-only, then $(TARGET_DIR_WARNING_FILE) is
 > copied read-only into target/ but we may want to remove it during the
 > build process.

 > This poses no real problem, since target/ itself is guaranteed to be
 > writable, but for good measure, force $(TARGET_DIR_WARNING_FILE) to be
 > writable itself.

 > Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
