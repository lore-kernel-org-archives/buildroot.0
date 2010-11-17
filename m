From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Nov 2010 15:36:37 +0100
Subject: [Buildroot] [PATCH 2/4] libglib2: fix application for no
	builtin atomic patch
In-Reply-To: <1289811484-30702-3-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Mon, 15 Nov 2010 09:58:02 +0100")
References: <1289811484-30702-1-git-send-email-llandwerlin@gmail.com>
	<1289811484-30702-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <87hbfgaufe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  ....0-fix-compilation-with-no-builtin-atomic.patch |   25 --------------------
 llandwerlin>  ....0-fix-compilation-with-no-builtin-atomic.patch |   25 ++++++++++++++++++++
 llandwerlin>  2 files changed, 25 insertions(+), 25 deletions(-)

The '-M' option to git diff is very handy for this, at it would have
shown it as a direct rename. I believe you can put something like this
in your ~/.gitconfig

[diff]
        renames = "copy"

To have it done automatically.

Anyway, thanks for the patch, but I committed a similar patch already
(Sorry, I had some email problems yesterday).

-- 
Bye, Peter Korsgaard
