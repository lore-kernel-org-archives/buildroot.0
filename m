From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 20:09:13 +0200
Subject: [Buildroot] [PATCH v3 3/3] Revert "texinfo: new host package"
In-Reply-To: <1476187354-13966-3-git-send-email-patrickdepinguin@gmail.com>
 (Thomas De Schampheleire's message of "Tue, 11 Oct 2016 14:02:34
 +0200")
References: <1476187354-13966-1-git-send-email-patrickdepinguin@gmail.com>
 <1476187354-13966-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <87funyztti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > This reverts commit ea161cf6891c3a3a601dfce072f68ee4aed08d21.

 > The host-texinfo dependency is no longer used by any package, after using
 > another solution to the problem that required its introduction in the first
 > place.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
