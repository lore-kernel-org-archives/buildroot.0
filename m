From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 11:10:29 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: use order-only dependency so
 symlinks are made only once
In-Reply-To: <20200713011321.6905-1-danomimanchego123@gmail.com> (Danomi
 Manchego's message of "Sun, 12 Jul 2020 21:13:21 -0400")
References: <20200713011321.6905-1-danomimanchego123@gmail.com>
Message-ID: <87365jj4oq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > The staging symlink is being created on every invocation of "make" as it
 > depends on its destination directory, which is modified when the symlink
 > is created.  This is prevented by changing the destination directory
 > dependency to be order-only.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
