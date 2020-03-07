From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 21:36:51 +0100
Subject: [Buildroot] [PATCH] package/util-linux: upgrade to version
 2.35.1
In-Reply-To: <20200207231608.1745-1-unixmania@gmail.com> (unixmania's message
 of "Fri, 7 Feb 2020 20:16:08 -0300")
References: <20200207231608.1745-1-unixmania@gmail.com>
Message-ID: <875zffyk9o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Drop patches already applied upstream and, consequently, AUTORECONF.

 > util-linux 2.35.1 Release Notes
 > ===============================

 > build-sys:
 >    - add --disable-hwclock-gplv3  [Karel Zak]
 > chrt:
 >    - Use sched_setscheduler system call directly  [jonnyh64]
 > lib/randutils:
 >    - use explicit data types for bit ops  [Karel Zak]
 > libfdisk:
 >    - fix __copy_partition()  [Karel Zak]
 >    - make sure we use NULL after free  [Karel Zak]
 > libmount:
 >    - fix x- options use for non-root users  [Karel Zak]
 > po:
 >    - update uk.po (from translationproject.org)  [Yuri Chornoivan]
 > sfdisk:
 >    - make sure we do not overlap on --move  [Karel Zak]
 >    - remove broken step alignment for --move  [Karel Zak]

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
