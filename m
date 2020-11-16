From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:31:51 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: fix custom repo error
 message
In-Reply-To: <20201115044043.1885405-1-garret.kelly@gmail.com> (Garret Kelly's
 message of "Sat, 14 Nov 2020 23:40:43 -0500")
References: <20201115044043.1885405-1-garret.kelly@gmail.com>
Message-ID: <87ft593ux4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Garret" == Garret Kelly <garret.kelly@gmail.com> writes:

 > When using a custom git or mercurial repository for u-boot the error message
 > indicating a version had not been provided incorrectly stated that the URL was
 > missing. Update the error message to indicate that it's the version that's
 > missing.

 > Signed-off-by: Garret Kelly <garret.kelly@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
