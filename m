From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:16:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.6
In-Reply-To: <20210616062113.452781-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Jun 2021 08:21:13 +0200")
References: <20210616062113.452781-1-fontaine.fabrice@gmail.com>
Message-ID: <87a6nf68by.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-22222: Infinite loop in DVB-S2-BB dissector in Wireshark
 > 3.4.0 to 3.4.5 allows denial of service via packet injection or crafted
 > capture file

 > https://www.wireshark.org/security/wnpa-sec-2021-05.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
