From: Alexander Dahl <post@lespocky.de>
Date: Fri, 15 Jan 2016 14:12:47 +0100
Subject: [Buildroot] Standardizing format for specifying license(s)
In-Reply-To: <5698DDBE.3000402@imgtec.com>
References: <5698DDBE.3000402@imgtec.com>
Message-ID: <1a9e07dbd834ef9ca57e1b6a91d043c2@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei, 

Am 2016-01-15 12:53, schrieb Rahul Bedarkar:
> Any suggestions and thoughts are welcome.

If not already done, I would suggest to have those license stuff
compatible with SPDX [1]. I noticed license names in at least some
packages are not the same as the identifiers on
https://spdx.org/licenses/ ? so if someone wants to generate SPDX stuff
from a buildroot project, it maybe would be better to have a format for
names and delimiters which make it easier towards SPDX package data.

Greets
Alex

[1] https://en.wikipedia.org/wiki/Software_Package_Data_Exchange

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: 02C8 A590 7FE5 CA5F 3601  D1D5 8FBA 7744 CC87 10D0 ***
