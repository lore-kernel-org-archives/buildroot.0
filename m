From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 17:22:54 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <8737hr4xg6.fsf@dell.be.48ers.dk>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161213164933.6ffc2b51@free-electrons.com>
 <8737hr4xg6.fsf@dell.be.48ers.dk>
Message-ID: <20161213172254.750ab43b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Dec 2016 17:15:37 +0100, Peter Korsgaard wrote:

> Related to that - With the move to GPLv3, should we keep v5.6 around
> next to v5.8 for a while (as a version selection or separate packages)?
> 
> Maintaining both is not really nice, but GPLv3 is an issue for some
> people/companies.

I agree that this license change can be an issue for some
people/companies. However, for them, staying on Qt 5.6 is no a viable
solution long term either, right.

Also, do we do this for Samba ? For gcc ? For the myriad of other
projects that moved to GPLv3 ?

Isn't it going to be a pain to maintain both versions in parallel? A
Config.in choice doesn't get randomized on our autobuilders, so the
older version would never be tested.

So I'm not particularly thrilled with supporting both versions :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
