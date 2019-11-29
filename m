From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 15:20:42 +0100
Subject: [Buildroot] [PATCH next v8 2/6] Makefile: allow top-level
 parallel build with BR2_PER_PACKAGE_DIRECTORIES=y
In-Reply-To: <20191105164646.23820-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 5 Nov 2019 17:46:41 +0100")
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
 <20191105164646.23820-3-thomas.petazzoni@bootlin.com>
Message-ID: <87imn2ahmt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > With per-package folder support, top-level parallel build becomes
 > safe, so we can enclose the .NOTPARALLEL statement in a
 > !BR2_PER_PACKAGE_DIRECTORIES condition.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
