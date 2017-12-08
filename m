From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 08:40:05 +0100
Subject: [Buildroot] [PATCH] libostree: change license to LGPL-2.0+
In-Reply-To: <20171208043951.6qhgdnwytmouuitz@tarshish.tkos.co.il> (Baruch
 Siach's message of "Fri, 8 Dec 2017 06:39:51 +0200")
References: <20171207120313.25510-1-marcus.folkesson@gmail.com>
 <87o9na2pii.fsf@dell.be.48ers.dk>
 <20171208043951.6qhgdnwytmouuitz@tarshish.tkos.co.il>
Message-ID: <87tvx11xd6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Thu, Dec 07, 2017 at 10:32:05PM +0100, Peter Korsgaard wrote:
 >> >>>>> "Marcus" == Marcus Folkesson <marcus.folkesson@gmail.com> writes:
 >> 
 >> > The license is actually GNU LIBRARY GENERAL PUBLIC LICENSE
 >> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
 >> 
 >> Committed, thanks. src/libostree/ostree.h interesting enough refers to
 >> the 'lesser general public license' (E.G. the "new" meaning of LGPL from
 >> v2.1), but also still refers to 'version 2'.

 > Not in master as of ae2ec0ed742 (arch/arm: default to Cortex-A53 for AArch64).

Sorry, I've pushed it now.

-- 
Bye, Peter Korsgaard
