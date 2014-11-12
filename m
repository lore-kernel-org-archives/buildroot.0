From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 23:20:59 +0100
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <CAEk40fyb_q-WCBL71ho9u7Wm1T2cqzLgiJoU5d_t3K2svSPqVg@mail.gmail.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
 <20141112133418.728a5f52@free-electrons.com>
 <CAEk40fw3Kgtgq=mKdR3ib40tLtD5x4SF0sT0QJrrwKVCO_+BZA@mail.gmail.com>
 <20141112222752.228404f0@free-electrons.com>
 <CAEk40fyb_q-WCBL71ho9u7Wm1T2cqzLgiJoU5d_t3K2svSPqVg@mail.gmail.com>
Message-ID: <20141112232059.31f1de61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sid Bharij,

On Wed, 12 Nov 2014 16:19:27 -0600, Sid Bharij wrote:
> I am sorry if I caused this confusion. I do understand that buildroot
> is a build system, I am just trying to build my driver files using
> build root by the way of packages. What I was referring to were the
> lines pasted by Hiram below:(Do I need to add these to a top level
> package.mk file?)

Just create your own package. This is explained extensively in the
Buildroot documentation, see
http://buildroot.org/downloads/manual/manual.html#adding-packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
