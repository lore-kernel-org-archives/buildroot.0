From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:40:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: security bump to
 version 4.3.3
In-Reply-To: <20200617195654.39410-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 17 Jun 2020 21:56:54 +0200")
References: <20200617195654.39410-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7u8zhv9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-12740: tcprewrite in Tcpreplay through 4.3.2 has a
 >   heap-based buffer over-read during a get_c operation. The issue is
 >   being triggered in the function get_ipv6_next() at common/get.c.
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
