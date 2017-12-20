From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:51:41 +0100
Subject: [Buildroot] [PATCH 1/1] samba4: ensure that copied cache.txt is
 writable
In-Reply-To: <1511924124-3938-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Tue, 28 Nov 2017 21:55:24 -0500")
References: <1511924124-3938-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87wp1hazs2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > If the Buildroot tree is read-only, then cache.txt is copied read-only into
 > the build directory, and the configuration step fails.  Fix this in the
 > same way we do in other places, by opening permissions as we copy the file
 > using $(INSTALL).

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
