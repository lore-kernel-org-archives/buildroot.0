From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Sep 2012 12:00:34 +0200
Subject: [Buildroot] [PATCH] poco: fix parallel build failure
In-Reply-To: <983f847ed905297a7f8e78b258e482c71b13232a.1346227179.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 29 Aug 2012 11:04:05 +0300")
References: <983f847ed905297a7f8e78b258e482c71b13232a.1346227179.git.baruch@tkos.co.il>
Message-ID: <87k3vwq5z1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> This added patch should fix
 Baruch> http://autobuild.buildroot.net/results/1bf7e51ef30af9bbf5e423e80ef07212b83bdaf8/.

 Baruch> CROSSENV is now required also in the install stages to prevent a rebuild using
 Baruch> the host native toolchain.

 Baruch> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Baruch> ---

 Baruch> I've never encountered this build failure on my machine, so I
 Baruch> can't verify the fix. If this patch is accepted, and we won't
 Baruch> get these failures on the autobuild machines, I'll try to
 Baruch> upstream this patch.

Committed, thanks. Don't forget to send patch upstream.

-- 
Bye, Peter Korsgaard
