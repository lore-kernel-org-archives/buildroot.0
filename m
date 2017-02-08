From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 15:31:28 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
 in toolchain-wrapper
In-Reply-To: <87fujopxh4.fsf@dell.be.48ers.dk>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <20170208132039.0160d3ea@free-electrons.com>
 <87k290pzha.fsf@dell.be.48ers.dk> <1762252.FU4Uq4VmnQ@sagittea>
 <87fujopxh4.fsf@dell.be.48ers.dk>
Message-ID: <20170208153128.09d1e74a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 08 Feb 2017 15:29:27 +0100, Peter Korsgaard wrote:

>  >   2. Postpone problem: Buildroot also contains patches under GPLv3 and
>  >      anyway, users will use a GPLv3 compiler.  
> 
> I think that is the most sensible thing to do. What do others say?

Indeed, gcc itself, which is called by this wrapper, is under GPLv3. So
it's not a big deal if the wrapper is GPLv3 I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
