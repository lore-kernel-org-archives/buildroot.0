From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:22:56 +0200
Subject: [Buildroot] [PATCH] packages/pkg-download.mk: fix file locking
 over NFS
In-Reply-To: <1993147260.30143.1593108698133.JavaMail.zimbra@savoirfairelinux.com>
 (Maxim Cournoyer's message of "Thu, 25 Jun 2020 14:11:38 -0400 (EDT)")
References: <1993147260.30143.1593108698133.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <871rlbtonz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxim" == Maxim Cournoyer <maxim.cournoyer@savoirfairelinux.com> writes:

 > Hello,
 > The attached patch fixes the NFS lock mechanism not working.

 > Tested using NFS 4.2 and multiple build machines caching the same
 > source artifacts in parallel to an empty NFS directory.

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
