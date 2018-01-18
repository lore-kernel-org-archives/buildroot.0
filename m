From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 16:02:05 +0100
Subject: [Buildroot] [PATCH 4/5] python-see: new package
In-Reply-To: <CAGm1_ksx2Q3YLtnFxHQf7T2XGz_jxPTYPnDU1U_5jCwOyiCcGg@mail.gmail.com>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
 <20180111092520.28438-4-yegorslists@googlemail.com>
 <20180117234108.1935ccf2@windsurf>
 <CAGm1_ksx2Q3YLtnFxHQf7T2XGz_jxPTYPnDU1U_5jCwOyiCcGg@mail.gmail.com>
Message-ID: <20180118160205.5e8fc347@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 08:33:46 +0100, Yegor Yefremov wrote:

> > Applied to master, thanks. Just curious: why are you adding this
> > package? It seems to only do a cosmetic thing, no?  
> 
> This is a dependency of txtorcon, that will be needed for the next
> crossbar bump.

I don't see python-see being used in the python-txtorcon package you
just sent. Am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
