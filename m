From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 14:32:33 +0200
Subject: [Buildroot] [PATCH 1/3] package/tcpreplay: security bump to
 version 4.3.2
In-Reply-To: <20190813192340.21989-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 13 Aug 2019 21:23:38 +0200")
References: <20190813192340.21989-1-fontaine.fabrice@gmail.com>
Message-ID: <87blw2yj32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This release contains bug fixes only:
 >  - CVE-2019-8381 memory access in do_checksum() (#538)
 >  - CVE-2019-8376 NULL pointer dereference get_layer4_v6() (#537)
 >  - CVE-2019-8377 NULL pointer dereference get_ipv6_l4proto() (#536)
 >  - Rename Ethereal to Wireshark (#545)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
