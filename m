From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 10:02:54 +0200
Subject: [Buildroot] [PATCH] file: add upstream security fix
In-Reply-To: <09d9582ecdb7715d356d0eb5bf0bd0f6d6150e03.1529035008.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 15 Jun 2018 06:56:48 +0300")
References: <09d9582ecdb7715d356d0eb5bf0bd0f6d6150e03.1529035008.git.baruch@tkos.co.il>
Message-ID: <87lgbg4gup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-10360: The do_core_note function in readelf.c in
 > libmagic.a in file 5.33 allows remote attackers to cause a denial of
 > service (out-of-bounds read and application crash) via a crafted ELF
 > file.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
