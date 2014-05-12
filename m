From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 May 2014 22:21:53 +0200
Subject: [Buildroot] [PATCHv2] protobuf: host-protobuf can only be built
	on certain architectures
In-Reply-To: <1399916748-8733-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 12 May 2014 19:45:48 +0200")
References: <1399916748-8733-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n0u7noe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The host-protobuf package can only build on certain architectures. For
 > example, host-protobuf does not build on PowerPC platforms, causing
 > build failures on the autobuilders. Since we don't really care about
 > build platforms other than x86 and x86-64, this commit restricts the
 > build of host-protobuf to these architectures only, even though if
 > technically it could build on ARM and MIPS.

 > Fixes:

 >  http://autobuild.buildroot.org/results/9b9/9b9b20b0e4694b11425cdc2382650cdc2774e400/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 > Changes since v1:
 >  - Propagate the dependency to ola and collectd, as noticed by Baruch
 >    Siach

Committed, thanks.

-- 
Bye, Peter Korsgaard
