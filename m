From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Mar 2017 16:45:19 +0100
Subject: [Buildroot] [PATCH] lttng-libust: fix build on musl
In-Reply-To: <1488319770-6933-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 Feb 2017 23:09:30 +0100")
References: <1488319770-6933-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8760jlccq8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit backports two upstream patches in lttng-libust, that fix
 > the build with the musl C library.

 > Fixes:

 >   http://autobuild.buildroot.net/results/8bbcac9f9debf76cd1f56734bfd494677f2acd21/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
