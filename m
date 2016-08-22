From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 17:30:47 +0200
Subject: [Buildroot] [PATCH] pcre: fix compile error for m68k coldfire
In-Reply-To: <20160819212456.GY22524@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Fri, 19 Aug 2016 23:24:56 +0200")
References: <20160818062535.GA28475@waldemar-brodkorb.de>
 <20160819231348.2127118e@free-electrons.com>
 <20160819212456.GY22524@waldemar-brodkorb.de>
Message-ID: <8737lwstw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

Hi,

 >> 3/ Decide that we don't support BR2_BINFMT_FLAT_SEP_DATA at all on
 >> m68k. On master, BR2_BINFMT_FLAT_ONE was not available for m68k due
 >> to kernel issues, but they have been resolved, and
 >> BR2_BINFMT_FLAT_ONE is now enabled on m68k in the next branch. So I
 >> would suggest to also enable BR2_BINFMT_FLAT_ONE on m68k in master,
 >> disallow the selection of BR2_BINFMT_FLAT_SEP_DATA. If in the
 >> future someone is interested by -msep-data on m68k, this person can
 >> always restart the work and see how to fix the issues.

 > I vote for 3)

Yeah, me too.

-- 
Bye, Peter Korsgaard
