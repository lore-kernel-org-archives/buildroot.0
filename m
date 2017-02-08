From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 13:20:39 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
 in toolchain-wrapper
In-Reply-To: <2610985.18vsFpMzc5@sagittea>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-2-git-send-email-jezz@sysmic.org>
 <87k291rawq.fsf@dell.be.48ers.dk> <2610985.18vsFpMzc5@sagittea>
Message-ID: <20170208132039.0160d3ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 08 Feb 2017 11:07:07 +0100, J?r?me Pouiller wrote:

> > I'm not sure this detailed error handling is really needed, but OK.  
> 
> In fact I copy-paste get_source_date_epoch() from gcc git. So toolchain
> wrapper will produce exactly same error messages than upstream gcc
> (and it include same coding style error :-) ).

So now our toolchain-wrapper is under GPLv3 :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
