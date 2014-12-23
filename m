From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 23 Dec 2014 21:18:56 +0000
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <20141223205201.021ee085@free-electrons.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
 <CAGm1_ktp7gkprBXNLTvd3gE7LMv_9cyUXyF3eb3r83OGPie0NQ@mail.gmail.com>
 <1419337919.2781.6.camel@synopsys.com>
 <CAGm1_ktzvRWMrZHEVfrQnRdACs-N++Kwx5dq3Xp30YPxN-gQHw@mail.gmail.com>
 <1419345339.2781.9.camel@synopsys.com>
 <20141223205201.021ee085@free-electrons.com>
Message-ID: <1419369534.3284.4.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2014-12-23 at 20:52 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue, 23 Dec 2014 14:35:40 +0000, Alexey Brodkin wrote:
> 
> > Even thought I haven't done any extensive testing I don't see any
> > suspicious behavior.
> > 
> > So I think "console" in BR2_TARGET_GENERIC_GETTY_PORT should be fine.
> 
> No, you can only login as root if you add "console" to /etc/securetty.

Interesting, then how it worked for me?

I have the same login prompt as usual:
--->---
Welcome to Buildroot
buildroot login:
--->---

Here I enter "root" as usual, press Enter and that's it.
"whoami" says "root" and I may modify any files etc.

What do I do wrong?

-Alexey
