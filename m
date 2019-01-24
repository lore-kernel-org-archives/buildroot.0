From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 12:30:38 +0100
Subject: [Buildroot] [PATCH] tcpreplay: security bump to version 4.3.1
In-Reply-To: <a85a18e1c92657beb563b238ffdd8548c3408b6b.1546964038.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 8 Jan 2019 18:13:58 +0200")
References: <a85a18e1c92657beb563b238ffdd8548c3408b6b.1546964038.git.baruch@tkos.co.il>
Message-ID: <87va2efg2p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Upstream CHANGELOG entry for 4.3.0 lists these fixes:
 >     - CVE-2018-18408 use-after-free in post_args (#489)
 >     - CVE-2018-18407 heap-buffer-overflow csum_replace4 (#488)
 >     - CVE-2018-17974 heap-buffer-overflow dlt_en10mb_encode (#486)
 >     - CVE-2018-17580 heap-buffer-overflow fast_edit_packet (#485)
 >     - CVE-2018-17582 heap-buffer-overflow in get_next_packet (#484)
 > 	- CVE-2018-13112 heap-buffer-overflow in get_l2len (#477 dup #408)

 > Drop tr_cv_libpcap_version and ac_cv_have_bpf; unused in current
 > configure script.

 > Make configure script use pcap-config to list library dependencies.
 > Unfortunately, pcap-config is not entirely correct, so we still need to
 > set the LIBS variable for static linking.

 > Use the smaller tar.xz archive.

 > Add license file hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
