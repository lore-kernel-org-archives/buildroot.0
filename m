From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 20:36:08 +0200
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: no comment if BR2_USE_MMU
 is true
In-Reply-To: <8c904ae4-62eb-4006-a71e-9724fa91207e@mind.be> (Arnout
 Vandecappelle's message of "Tue, 2 Oct 2018 23:17:12 +0200")
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
 <878t3nw3mu.fsf@dell.be.48ers.dk>
 <8c904ae4-62eb-4006-a71e-9724fa91207e@mind.be>
Message-ID: <87pnwo2qcn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 27/09/2018 14:01, Peter Korsgaard wrote:
 >>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > Don't display comment if BR2_USE_MMU is true
 >> > Moreover, move BR2_USE_MMU dependency at the top of dependency list
 >> 
 >> I'm not sure if that is really any better. I don't think we have any
 >> strong rules about this, but in lack of other rules I would say sort
 >> alphabetically.

 >  I thought we had a weak rule of:

 >  - first arch dependencies (i.e. where you have no choice);

 >  - then toolchain dependencies (i.e. where you can enable them, and which need a
 > comment);

 >  - then package dependencies;

 >  - then select.

 > And alphabetical within each category.

Sounds sensible, but I don't think this is written down anywhere
official.

-- 
Bye, Peter Korsgaard
