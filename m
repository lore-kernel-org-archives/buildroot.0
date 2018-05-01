From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 09:28:46 +0200
Subject: [Buildroot] [PATCH 1/3] libgpgme: fix run-time compatibility
 with gnupg2 2.2.6
In-Reply-To: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 17 Apr 2018 12:37:11 +0300")
References: <d59c6c57aff0a6c8966f33b2ee80bfa6328723f5.1523957833.git.baruch@tkos.co.il>
Message-ID: <87lgd3ltqp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch fixing gpgme_op_verify regression with gnupg2 2.2.6.
 > https://lists.gnupg.org/pipermail/gnupg-users/2018-April/060230.html

 > Cc: Philipp Claves <claves@budelmann-elektronik.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
