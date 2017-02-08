From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Feb 2017 14:46:09 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
	in toolchain-wrapper
In-Reply-To: <20170208132039.0160d3ea@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 8 Feb 2017 13:20:39 +0100")
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-2-git-send-email-jezz@sysmic.org>
 <87k291rawq.fsf@dell.be.48ers.dk> <2610985.18vsFpMzc5@sagittea>
 <20170208132039.0160d3ea@free-electrons.com>
Message-ID: <87k290pzha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Wed, 08 Feb 2017 11:07:07 +0100, J?r?me Pouiller wrote:

 >> > I'm not sure this detailed error handling is really needed, but OK.  
 >> 
 >> In fact I copy-paste get_source_date_epoch() from gcc git. So toolchain
 >> wrapper will produce exactly same error messages than upstream gcc
 >> (and it include same coding style error :-) ).

 > So now our toolchain-wrapper is under GPLv3 :-/

Yes, if the function is considered large and and original enough to be
considered copyrightable - Afterall it is just a getenv + strtoll and a
bit of error checking.

-- 
Bye, Peter Korsgaard
