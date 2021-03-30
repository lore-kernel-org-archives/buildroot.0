From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 08:16:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.4
In-Reply-To: <20210329195407.251619-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Mar 2021 21:54:07 +0200")
References: <20210329195407.251619-1-fontaine.fabrice@gmail.com>
Message-ID: <87im59dv46.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-22191: Improper URL handling in Wireshark 3.4.0 to 3.4.3
 > and 3.2.0 to 3.2.11 could allow remote code execution via via packet
 > injection or crafted capture file.

 > https://www.wireshark.org/security/wnpa-sec-2021-03.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
