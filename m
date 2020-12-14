From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:49:08 +0100
Subject: [Buildroot] [PATCH] package/libglib2: correct upstream status
 for patch 0001
In-Reply-To: <20201209112634.18600-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 9 Dec 2020 12:26:32 +0100")
References: <20201209112634.18600-1-patrickdepinguin@gmail.com>
Message-ID: <873608xx23.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Patch '0001-fix-compile-time-atomic-detection.patch' claims to be Merged but
 > this is not true. The linked issue is closed with 'Needs information', and
 > the code itself is effectively not merged.

 > Clarify the 'Upstream-status' line to make this more clear.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > ---
 >  package/libglib2/0001-fix-compile-time-atomic-detection.patch | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > Note: I leave the actual discussion with upstream to Adam, as he was involved in
 > the issue before.

Committed, thanks.

-- 
Bye, Peter Korsgaard
