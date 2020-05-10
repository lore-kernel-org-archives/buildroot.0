From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:29:23 +0200
Subject: [Buildroot] [2020.02.x] package/libsepol: fix -fno-common build
 failures
In-Reply-To: <20200505165457.GE12536@scaer> (Yann E. MORIN's message of "Tue, 
 5 May 2020 18:54:57 +0200")
References: <20200505125546.4207-1-matthew.weber@rockwellcollins.com>
 <20200505165457.GE12536@scaer>
Message-ID: <873687twq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > This patch from Matthew is a backport-with-modifications of the patch of
 > the same title that went on master:

 >     17e71b34621 package/libsepol: fix -fno-common build faiures

 > So, do not cherry-pick the patch on master, but apply this one. ;-)

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
