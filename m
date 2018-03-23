From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:26:59 +0100
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.32
In-Reply-To: <b647177fcbd624bf6c2e489e852612e3962dac39.1521794140.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 23 Mar 2018 11:35:40 +0300")
References: <b647177fcbd624bf6c2e489e852612e3962dac39.1521794140.git.baruch@tkos.co.il>
Message-ID: <87k1u23j98.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Leave both _VERSION_MAJOR and _VERSION to reduce churn. We are likely to
 > need _MAJOR on the next bump.

 > Drop ac_cv_header_sys_timex_h override; not needed with current
 > uClibc-ng.

 > Drop scanf_cv_type_modifier override; not used in configure script since
 > v2.21.

 > Drop upstream patch.

 > Cc: Carlos Santos <casantos@datacom.ind.br>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
