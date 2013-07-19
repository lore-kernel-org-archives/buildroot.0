From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 11:56:40 +0200
Subject: [Buildroot] [PATCH v2 0/3] Upgrade ARC port to new toolchain
In-Reply-To: <1374184072-6531-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Thu, 18 Jul 2013 23:47:49 +0200")
References: <1374184072-6531-1-git-send-email-mjonker@synopsys.com>
Message-ID: <87k3kmvpnr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> These three patches upgrade the ARC toolchain to GCC 4.8 and
 Mischa> Binutils 2.23.2. This fixes multiple issues (including most
 Mischa> autobuilder failures from the past couple of weeks).

 Mischa> v2:
 Mischa>   * Remove gcc 4.4.7 patch
 Mischa>   * Fix whitespace in fix_branch_out_of_range.patch
 Mischa>   * Remove binutils 2.19-arc dependencies (not required anymore)
 Mischa>   * Fix gcc 4.8-arc dependencies (host-flex, host-bison still required :-( )

Committed series, thanks.

-- 
Bye, Peter Korsgaard
