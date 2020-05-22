From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 09:44:56 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: fix for fchownat/fchmodat
In-Reply-To: <20200510203509.7628-1-nolange79@gmail.com> (Norbert Lange's
 message of "Sun, 10 May 2020 22:35:08 +0200")
References: <20200510203509.7628-1-nolange79@gmail.com>
Message-ID: <87y2pkl8g7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > fakeroot does mask out necessary flags, instead pass through
 > the flags that are supported by fstatat

 > Upstream BR: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959876

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
