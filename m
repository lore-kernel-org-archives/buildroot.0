From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Jul 2020 23:02:11 +0200
Subject: [Buildroot] [PATCH 2/2] package/upx: security bump to version
 3.96
In-Reply-To: <20200606192033.2763135-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Jun 2020 21:20:33 +0200")
References: <20200606192033.2763135-1-fontaine.fabrice@gmail.com>
 <20200606192033.2763135-2-fontaine.fabrice@gmail.com>
Message-ID: <87h7ul65gs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to github to get latest release
 > - Fix CVE-2019-20805: p_lx_elf.cpp in UPX before 3.96 has an integer
 >   overflow during unpacking via crafted values in a PT_DYNAMIC segment.
 > - Fix CERT-FI Case 829767 UPX command line tools segfaults.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
