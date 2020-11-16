From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:25:26 +0100
Subject: [Buildroot] [PATCH] package/openntpd: needs host-bison
In-Reply-To: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 16 Nov 2020 13:18:29 +0200")
References: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
Message-ID: <87lff12dvd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Build fails when no yacc alternative is installed.
 > Fixes:
 > http://autobuild.buildroot.net/results/1ba8e339cbb5646663d0bf4e158d89e54433b242/
 > http://autobuild.buildroot.net/results/a00a53d6635c64e72c50d4841658155de5380110/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
