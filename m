From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 16:31:11 +0200
Subject: [Buildroot] [PATCH] elfutils: security bump to version 0.171
In-Reply-To: <ba51f7d0e34a8951b7c4b153f3b0e41a9a123199.1528438917.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 8 Jun 2018 09:21:57 +0300")
References: <ba51f7d0e34a8951b7c4b153f3b0e41a9a123199.1528438917.git.baruch@tkos.co.il>
Message-ID: <87r2lhbb9s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-8769: buffer over-read in the ebl_dynamic_tag_name
 > function of libebl/ebldynamictagname.c because SYMTAB_SHNDX is
 > unsupported.

 > Drop the po/ disable patch; not needed anymore.

 > Drop the __mempcpy compatibility patch; __mempcpy is not used anymore.

 > Refresh the -Werror removal patch; still needed, unfortunately.

 > Renumber the remaining patches.

 > Add GPLv3 license file.

 > Add license files hash.

 > Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed after adding the security reference, thanks.

-- 
Bye, Peter Korsgaard
