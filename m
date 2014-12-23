From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 20:52:01 +0100
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <1419345339.2781.9.camel@synopsys.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
 <CAGm1_ktp7gkprBXNLTvd3gE7LMv_9cyUXyF3eb3r83OGPie0NQ@mail.gmail.com>
 <1419337919.2781.6.camel@synopsys.com>
 <CAGm1_ktzvRWMrZHEVfrQnRdACs-N++Kwx5dq3Xp30YPxN-gQHw@mail.gmail.com>
 <1419345339.2781.9.camel@synopsys.com>
Message-ID: <20141223205201.021ee085@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 23 Dec 2014 14:35:40 +0000, Alexey Brodkin wrote:

> Even thought I haven't done any extensive testing I don't see any
> suspicious behavior.
> 
> So I think "console" in BR2_TARGET_GENERIC_GETTY_PORT should be fine.

No, you can only login as root if you add "console" to /etc/securetty.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
