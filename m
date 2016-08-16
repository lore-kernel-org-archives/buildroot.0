From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 08:00:31 +0200
Subject: [Buildroot] [PATCH v2] poco: fix m68k compile
In-Reply-To: <20160812203957.GA2064@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 12 Aug 2016 22:39:58 +0200")
References: <20160812203957.GA2064@waldemar-brodkorb.de>
Message-ID: <877fbhxngg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Add a patch from double-conversion upstream project which is bundled
 > with poco to fix compile for m68k.

 > Fixes:
 >   http://autobuild.buildroot.net/results/791917c1343f53e12f27b06cfd5e1d2e88078014/
 >   http://autobuild.buildroot.net/results/349d4b49d65a652551c4de20233684bb4ffa5ae3/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1 -> v2:
 >  - add better comment and commit id, suggested by Baruch

Committed, thanks.

-- 
Bye, Peter Korsgaard
