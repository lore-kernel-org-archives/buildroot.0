From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:03:29 +0200
Subject: [Buildroot] [PATCH 2/3] linux: build after intel-microcode if
 enabled for early loading support
In-Reply-To: <20190520221712.22564-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 21 May 2019 00:17:11 +0200")
References: <20190520221712.22564-1-peter@korsgaard.com>
 <20190520221712.22564-2-peter@korsgaard.com>
Message-ID: <877e9ylpry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > To support building in (a subset of) the intel-microcode files into the
 > kernel using the CONFIG_EXTRA_FIRMWARE option, we need to ensure that the
 > microcode files are installed before the Linux kernel is built.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
