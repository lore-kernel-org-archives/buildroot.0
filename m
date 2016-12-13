From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 17:15:37 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <20161213164933.6ffc2b51@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 13 Dec 2016 16:49:33 +0100")
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161213164933.6ffc2b51@free-electrons.com>
Message-ID: <8737hr4xg6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Thanks for working on Qt packaging, definitely very important for
 > Buildroot.

 > Do you know when the final 5.8 is supposed to be released? If it's
 > released before Buildroot 2017.02, then we could take your patches
 > right now, and update them to the final release when it comes out. This
 > way, they would get some exposure (both in terms of Buildroot users
 > exposure, and in terms of autobuilder testing).

Related to that - With the move to GPLv3, should we keep v5.6 around
next to v5.8 for a while (as a version selection or separate packages)?

Maintaining both is not really nice, but GPLv3 is an issue for some
people/companies.

-- 
Bye, Peter Korsgaard
