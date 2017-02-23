From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 21:20:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-22
In-Reply-To: <20170223200631.GB3910@free.fr>
References: <20170223072850.D0F0B20BE0@mail.free-electrons.com>
 <20170223171655.GA3910@free.fr>
 <20170223184807.1deec0de@free-electrons.com>
 <20170223200631.GB3910@free.fr>
Message-ID: <20170223212030.2a6a10af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 21:06:31 +0100, Yann E. MORIN wrote:

> And now I seem to remember that we already questioned that some time in
> the past...

Yes, I even asked on the pkg-config mailing list how we are supposed to
handle such a situation, and they didn't had a very clear answer.

But I guess we need to go ahead and tweak the DirectFB .pc files and
add -lstdc++ in Libs.private. It's the most logical thing to do IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
