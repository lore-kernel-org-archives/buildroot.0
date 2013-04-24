From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 24 Apr 2013 15:19:14 +0000
Subject: [Buildroot] [PATCH 5/7] arc: Add support for ARC-specific GCC
In-Reply-To: <20130424162751.6500c3df@skate>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-6-git-send-email-mjonker@synopsys.com>
 <20130422175605.135d02f5@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA04F@de02wembxa.internal.synopsys.com>
 <20130424162751.6500c3df@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D6339FA09B@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > The change is in the upstream project now. Would you like me to change 
> > the gnuconfig patch in BuildRoot from 'add ARC to gnuconfig'
> > to 'update gnuconfig from upstream'?

> Yes, that'd be great.

There are some patches with your name on it in support/gnuconfig/patches. 
These patches seem to be applied already on support/gnuconfig/*. I have 
updated these patches so that they apply cleanly on top of the new gnuconfig
(+small ARC-specific addition), but they still have your Signed-off-by tag. 

What's the proper procedure for signing off patches within a patch? 

Mischa
