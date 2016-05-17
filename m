From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:23:57 +0200
Subject: [Buildroot] [PATCH master] boost: fix build failures on NIOSII
	and Microblaze
In-Reply-To: <1463490029-22781-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 15:00:29 +0200")
References: <1463490029-22781-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87shxgbyxe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The fenv support provided by glibc on NIOSII and Microblaze is not
 > sufficient for Boost, causing the same build failures as the ones we had
 > with uClibc.

 > To address this, we adapt (and rename) the existing
 > 0006-uclibc-fenv.patch by forcefully disabling fenv support in Boost on
 > NIOSII and Microblaze, in addition to the existing uClibc exclusion.

 > Fixes (for NIOSII):

 >   http://autobuild.buildroot.net/results/9b8c5d2cd31d63ae70b41d1434868c83e65b8423/

 > Fixes (for Microblaze):

 >   http://autobuild.buildroot.net/results/0b9db4c5cfd80d75eb620dbf7a6201faed7230a1/

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
