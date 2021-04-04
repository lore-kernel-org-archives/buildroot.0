From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 11:50:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpm: security bump to version
 4.16.1.3
In-Reply-To: <20210402193343.1998309-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Apr 2021 21:33:43 +0200")
References: <20210402193343.1998309-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8eu1iq3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix arbitrary data copied from signature header past signature
 >   checking (CVE-2021-3421)
 > - Fix signature check bypass with corrupted package (CVE-2021-20271)
 > - Fix missing bounds checks in headerImport() and headerCheck()
 >   (CVE-2021-20266)
 > - Fix missing sanity checks on header entry count and region data
 >   overlap
 > - Fix access past end of header if the last entry is string type
 > - Fix unsafe headerCopyLoad() still used in codebase

 > Drop all patches (already in version)

 > https://rpm.org/wiki/Releases/4.16.1.3.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
