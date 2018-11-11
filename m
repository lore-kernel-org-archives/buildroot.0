From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Nov 2018 21:26:09 +0100
Subject: [Buildroot] [PATCH 1/1] wireshark: fix static build
In-Reply-To: <20181111192342.27644-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 11 Nov 2018 20:23:42 +0100")
References: <20181111192342.27644-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7mf5pjy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't give a path in --with-pcap option otherwise PCAP_CONFIG won't be
 > used (see AC_WIRESHARK_PCAP_CHECK in acinclude.m4) to retrieve pcap
 > static dependencies such as -lnl-3 and as a result pcap detection will
 > fail

 > Fixes:
 >  - http://autobuild.buildroot.org/results/084354a33825cf4e723e0a9f1e9656ad2a212a15

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
