From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:25:28 +0200
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.2.6 (security)
In-Reply-To: <20170413133720.38755-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Thu, 13 Apr 2017 14:37:20 +0100")
References: <20170413133720.38755-1-Vincent.Riera@imgtec.com>
Message-ID: <87wpa9vc9j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Security fixes:
 > - wnpa-sec-2017-12
 >   IMAP dissector crash (Bug 13466) CVE-2017-7703
 > - wnpa-sec-2017-13
 >   WBMXL dissector infinite loop (Bug 13477) CVE-2017-7702
 > - wnpa-sec-2017-14
 >   NetScaler file parser infinite loop (Bug 13478) CVE-2017-7700
 > - wnpa-sec-2017-15
 >   RPCoRDMA dissector infinite loop (Bug 13558) CVE-2017-7705
 > - wnpa-sec-2017-16
 >   BGP dissector infinite loop (Bug 13557) CVE-2017-7701
 > - wnpa-sec-2017-17
 >   DOF dissector infinite loop (Bug 13453) CVE-2017-7704
 > - wnpa-sec-2017-18
 >   PacketBB dissector crash (Bug 13559)
 > - wnpa-sec-2017-19
 >   SLSK dissector long loop (Bug 13576)
 > - wnpa-sec-2017-20
 >   SIGCOMP dissector infinite loop (Bug 13578)
 > - wnpa-sec-2017-21
 >   WSP dissector infinite loop (Bug 13581)

 > Full release notes:

 >   https://www.wireshark.org/docs/relnotes/wireshark-2.2.6.html

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
