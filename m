From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:34:17 +0200
Subject: [Buildroot] [PATCH] elfutils: security bump to version 0.169
In-Reply-To: <b55c4c39417ad139014c611fc3a24ecf312d68db.1496091203.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 29 May 2017 23:53:23 +0300")
References: <b55c4c39417ad139014c611fc3a24ecf312d68db.1496091203.git.baruch@tkos.co.il>
Message-ID: <87mv9rixp2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes a number of security issues: CVE-2017-7607, CVE-2017-7608,
 > CVE-2017-7609, CVE-2017-7610, CVE-2017-7611, CVE-2017-7612, CVE-2017-7613.

 > Rebase patches, and convert to git format.

 > Remove --disable-werror; unrecognized configure option.

 > Use upstream provided hash.

 > Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
