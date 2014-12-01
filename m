From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:24:49 +0100
Subject: [Buildroot] [PATCHv3 37/74] rp-pppoe: bail out of installation
	fails
In-Reply-To: <1417357142-14307-38-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:25 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-38-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjb780um.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Add an "|| exit 1" in the installation loop, otherwise if one of the
 > file fails to install, the build doesn't abort.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed with the typo fixed, thanks.

-- 
Bye, Peter Korsgaard
