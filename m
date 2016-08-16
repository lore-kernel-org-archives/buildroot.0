From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 07:55:21 +0200
Subject: [Buildroot] [PATCH] gmp: disable assembly for arc
In-Reply-To: <1471272107-17275-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Mon, 15 Aug 2016 17:41:47 +0300")
References: <1471272107-17275-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87bn0txnp2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > It has different inline assembly constraints that
 > are not supported after update to gcc-6.

 > Fixes:
 > http://autobuild.buildroot.net/results/c91/c9143eec0834017d57d5352d6fc95b5fae38da00//
 > and a lot of other failures of gmp-6.1.1 for ARC.

 > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Committed, thanks.

Are you working on getting this fixed in upstream gcc/gmp for future
releases?

-- 
Venlig hilsen,
Peter Korsgaard 
