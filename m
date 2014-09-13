From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 21:54:45 +0200
Subject: [Buildroot] [PATCH] libsvg-cairo: explicitly disable X support
In-Reply-To: <1410472215-19818-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 11 Sep 2014 23:50:15 +0200")
References: <1410472215-19818-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87egvf8fei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Our libsvg-cairo package doesn't have any dependency on X, and the
 > source code doesn't seem to be using X. However, the configure script
 > checks for X headers and libraries. If they are found on the host,
 > /usr/lib and /usr/include get added to the library/header paths
 > causing weird build failures. This commit should fix this problem by
 > explicitly disabling the X support.

 > Should fix:

 >   http://autobuild.buildroot.org/results/d0f/d0fc233bb97c2ea18344746a5b7c63c8de65330a/
 >   http://autobuild.buildroot.org/results/0b3/0b3fb2ee9916aa265df5b6e4f04f6dfa25d1fc84/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
