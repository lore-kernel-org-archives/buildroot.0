From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:43:40 +0100
Subject: [Buildroot] [PATCH 1/8] package/opkg-utils: remove build step
In-Reply-To: <20210312200534.923-2-ryan.barnett@rockwellcollins.com> (Ryan
 Barnett's message of "Fri, 12 Mar 2021 14:05:27 -0600")
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
 <20210312200534.923-2-ryan.barnett@rockwellcollins.com>
Message-ID: <87blbdu66b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:

 > opkg-utils is a package that only provides bash and python scripts.
 > Upon further inspection of the Makefile for the package, invoking
 > `make` is equivalent to `make install`. The makes the build step
 > unnecessary so remove it.

 > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
