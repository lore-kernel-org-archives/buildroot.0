From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Dec 2018 00:24:35 +0100
Subject: [Buildroot] [git commit] package/uclibc: add upstream patch to
 fix aarch64 issues
In-Reply-To: <20181203081158.978847FD0C@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 3 Dec 2018 09:15:21 +0100")
References: <20181203081158.978847FD0C@busybox.osuosl.org>
Message-ID: <87mupdt170.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=2179ca4a61b4574854075e4cdc1e2b851fa0d5b3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > fstatfs/statfs on aarch64 seems broken, add a patch from uClibc-ng
 > upstream git to fix it.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
