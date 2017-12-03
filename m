From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 15:15:07 +0100
Subject: [Buildroot] [PATCH 2/2] kvmtool: bump to f77d646ba0
In-Reply-To: <CANQCQpaQzSj_4cKDAnGViSySBFgWmywc2mjdWgEiG2WfW7eLXg@mail.gmail.com>
References: <20171203033321.13460-1-matthew.weber@rockwellcollins.com>
 <20171203033321.13460-2-matthew.weber@rockwellcollins.com>
 <20171203145407.78bab7c2@windsurf.home>
 <CANQCQpaQzSj_4cKDAnGViSySBFgWmywc2mjdWgEiG2WfW7eLXg@mail.gmail.com>
Message-ID: <20171203151507.0964bc86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Dec 2017 08:05:00 -0600, Matthew Weber wrote:

> (Pardon the rich text, just have my tablet this morning)
> 
> I forgot to run both of the kvm updates through testpkg, so I'll do that
> and take a look at this one.

No problem. I don't always do a test build before pushing version
bumps, because I rely on the autobuilders to do such testing. But
sometimes I do a quick build test, which was the case here, and it
found an issue :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
