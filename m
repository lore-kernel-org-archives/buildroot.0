From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Mar 2020 16:37:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/jhead: security bump to version
 3.04
In-Reply-To: <20200304214532.1018182-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 4 Mar 2020 22:45:32 +0100")
References: <20200304214532.1018182-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7z2byos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-1010301: jhead 3.03 is affected by: Buffer Overflow. The
 >   impact is: Denial of service. The component is: gpsinfo.c Line 151
 >   ProcessGpsInfo(). The attack vector is: Open a specially crafted JPEG
 >   file.
 > - Fix CVE-2019-1010302: jhead 3.03 is affected by: Incorrect Access
 >   Control. The impact is: Denial of service. The component is: iptc.c
 >   Line 122 show_IPTC(). The attack vector is: the victim must open a
 >   specially crafted JPEG file.
 > - Fix CVE-2019-19035: jhead 3.03 is affected by: heap-based buffer
 >   over-read. The impact is: Denial of service. The component is:
 >   ReadJpegSections and process_SOFn in jpgfile.c. The attack vector is:
 >   Open a specially crafted JPEG file.
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
