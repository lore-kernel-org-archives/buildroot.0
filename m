From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 May 2013 13:11:19 +0200
Subject: [Buildroot] [PATCH 02/20] dropbear: factorize the 'depends on
	BR2_PACKAGE_DROPBEAR'
In-Reply-To: <1369606110-8088-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 27 May 2013 00:08:12 +0200")
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369606110-8088-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738t8ekyw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Enclose all dropbear sub-options into a 'if BR2_PACKAGE_DROPBEAR'
 Thomas> ... 'endif' block rather than having 'depends on BR2_PACKAGE_DROPBEAR'
 Thomas> for each option.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
