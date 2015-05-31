From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 11:53:38 +0200
Subject: [Buildroot] [PATCH] support/download: relocate the git clone
	comment
In-Reply-To: <3984ae0102b12ee65d6cf41e2f20bde2d6cea3ae.1432812928.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 28 May 2015 14:35:28 +0300")
References: <3984ae0102b12ee65d6cf41e2f20bde2d6cea3ae.1432812928.git.baruch@tkos.co.il>
Message-ID: <87h9qtvzrx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Following commit 95a572282e87 (pkg-infra: move the git download helper to a
 > script, 2014-07-02), move the comment describing the shallow clone trickery as
 > well. Merge this comment with the existing helper comment that was added in
 > 7e40a1103a91 (support/download: convert git to use the wrapper, 2014-08-03).

 > Rename $($(PKG)_DL_VERSION) to ${cset} to match the helper code context.

 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
