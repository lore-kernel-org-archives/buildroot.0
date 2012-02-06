From: Stefan Miklosovic <miklosovic.freebsd@gmail.com>
Date: Mon, 6 Feb 2012 03:08:57 +0100
Subject: [Buildroot] eth0 in buildroot (vmware)
In-Reply-To: <CAMWiMy-5s_BMCGbpJka1HUS5jGHa3Dxf0SzA+kUCqpPsnyuyHw@mail.gmail.com>
References: <CAPRmHH2q3bY22dSE0BVooO3OSDr6eXz2U42euRzaU00CJbqn1A@mail.gmail.com>
 <CAMWiMy-5s_BMCGbpJka1HUS5jGHa3Dxf0SzA+kUCqpPsnyuyHw@mail.gmail.com>
Message-ID: <CAPRmHH1bzTBHLmRTTbMuaPEE6ppKyotwV7GvBGCs4pZuqtNDTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This one did the trick ... for everyone to know in order to prevent
questions like this one:

i had to compile some additional network driver to the kernel
(Intel(R) 82575/82576 PCI-Express Gigabit Ethernet support + Intel(R)
82576 Virtual Function Ethernet support) and switch network adapter in
virtualbox settings like Intel PRO/1000 MT Desktop (82540EM) under
network ? adapter 1 ? ?advanced? settings

On Sun, Feb 5, 2012 at 10:37 PM, curriegrad2004
<curriegrad2004@gmail.com> wrote:
>
> Have you built in the e1000 drivers and pcnet32 drivers too? Those are
> the drivers that VMware uses for virtual machines
