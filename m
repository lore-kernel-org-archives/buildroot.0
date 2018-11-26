From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:15:09 +0100
Subject: [Buildroot] [PATCH next v6 04/10] Makefile: move .NOTPARALLEL
 statement after including .config file
In-Reply-To: <20181123145815.13008-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 23 Nov 2018 15:58:09 +0100")
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-5-thomas.petazzoni@bootlin.com>
Message-ID: <87sgznso2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In a follow-up commit, we will make the .NOTPARALLEL statement
 > conditional on a Config.in option, so we need to move it further down.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
