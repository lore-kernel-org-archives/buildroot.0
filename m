From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 18:53:27 +0100
Subject: [Buildroot] [PATCH 1/1] setools: disable arch sparc64
In-Reply-To: <CAFt09wP3f3xJWf96Av=gs6yTQ2NCim+OfsvcR8W3ojvrzKLvbw@mail.gmail.com>
References: <1458698562-11227-1-git-send-email-matt@thewebers.ws>
 <20160323130907.3c2c28ff@free-electrons.com>
 <CAFt09wP3f3xJWf96Av=gs6yTQ2NCim+OfsvcR8W3ojvrzKLvbw@mail.gmail.com>
Message-ID: <20160326185327.253d354e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 16:31:13 -0500, Matthew Weber wrote:

> Good to know.  I'll reject this patch and do some further testing.

In fact, it's just -fPIC vs. -fpic. I've committed a fix:

  https://git.busybox.net/buildroot/commit/?id=8a2e75633f136f021692354434ac0b2d9a81e38c

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
