From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 14:01:29 +0200
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: no comment if BR2_USE_MMU
 is true
In-Reply-To: <20180926182045.28484-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 26 Sep 2018 20:20:44 +0200")
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
Message-ID: <878t3nw3mu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't display comment if BR2_USE_MMU is true
 > Moreover, move BR2_USE_MMU dependency at the top of dependency list

I'm not sure if that is really any better. I don't think we have any
strong rules about this, but in lack of other rules I would say sort
alphabetically.

But ok, I don't feel strongly about it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
