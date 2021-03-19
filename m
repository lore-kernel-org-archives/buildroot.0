From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 23:15:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.16.2
In-Reply-To: <20210312214717.GD2737665@scaer> (Yann E. MORIN's message of
 "Fri, 12 Mar 2021 22:47:17 +0100")
References: <20210312205659.76580-1-christian@paral.in>
 <20210312214717.GD2737665@scaer>
Message-ID: <87k0q2u6x1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Christian, All,
 > On 2021-03-12 12:56 -0800, Christian Stewart spake thusly:
 >> go1.16.1 (released 2021/03/10) includes security fixes to the archive/zip and
 >> encoding/xml packages.
 >> 
 >> go1.16.2 (released 2021/03/11) includes fixes to cgo, the compiler, linker, the
 >> go command, and the syscall and time packages.
 >> 
 >> https://golang.org/doc/devel/release.html#go1.16
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>

 > Applied to master, thanks.

For 2020.11.x and 2021.02.x I have instead bumped to 1.15.10, which
contains the same fixes.

-- 
Bye, Peter Korsgaard
