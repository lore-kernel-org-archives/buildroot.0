From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 09:42:20 +0100
Subject: [Buildroot] [PATCH] wireshark: bump to version 1.10.6
In-Reply-To: <1394254169.27904.1.camel@phoenix>
References: <1394254169.27904.1.camel@phoenix>
Message-ID: <20140308094220.1b06df05@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Sat, 08 Mar 2014 12:49:29 +0800, Axel Lin wrote:
>    The following vulnerabilities have been fixed.
>      * [1]wnpa-sec-2014-01
>        The NFS dissector could crash. Discovered by Moshe Kaplan.
>        ([2]Bug 9672)
>        Versions affected: 1.10.0 to 1.10.5, 1.8.0 to 1.8.12
>        [3]CVE-2014-2281
>      * [4]wnpa-sec-2014-02
>        The M3UA dissector could crash. Discovered by Laurent
>        Butti. ([5]Bug 9699)
>        Versions affected: 1.10.0 to 1.10.5
>        [6]CVE-2014-2282
>      * [7]wnpa-sec-2014-03
>        The RLC dissector could crash. ([8]Bug 9730)
>        Versions affected: 1.10.0 to 1.10.5, 1.8.0 to 1.8.12
>        [9]CVE-2014-2283
>      * [10]wnpa-sec-2014-04
>        The MPEG file parser could overflow a buffer. Discovered by
>        Wesley Neelen. ([11]Bug 9843)
>        Versions affected: 1.10.0 to 1.10.5, 1.8.0 to 1.8.12
>        [12]CVE-2014-2299

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
