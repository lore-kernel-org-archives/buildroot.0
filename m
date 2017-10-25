From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:41:20 +0200
Subject: [Buildroot] [RFC v2 1/4] package/go: fixing crosscompilation
	settings
In-Reply-To: <20171021215107.1e4fa5e2@windsurf> (Thomas Petazzoni's message of
 "Sat, 21 Oct 2017 21:51:07 +0200")
References: <1508173728-29181-1-git-send-email-angelo.compagnucci@gmail.com>
 <20171021215107.1e4fa5e2@windsurf>
Message-ID: <87a80f65en.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 16 Oct 2017 19:08:45 +0200, Angelo Compagnucci wrote:
 >> This patch fixes a bug with the BR2_TOOLCHAIN_HAS_THREADS variable
 >> handling which causes CGO_ENABLED to be always 0.
 >> 
 >> Furthermore, it fixes the cross compilation options for the go compiler:
 >> setting CGO_ENABLED should be done only for the target compiler not the
 >> host one.
 >> 
 >> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 >> ---
 >> package/go/go.mk | 14 ++++++++------
 >> 1 file changed, 8 insertions(+), 6 deletions(-)

 > Thanks applied the patch, with Christian's Acked-by.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
