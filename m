From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 14:38:45 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <CAAXf6LXWCeGiH9bNsM=qaJ2bzH9RyOzu3FZpGxsmBsQyxHQMgw@mail.gmail.com>
References: <0533846efc9952901283.1399373479@argentina>
 <20140506140745.1b072d2c@skate>
 <CAAXf6LXWCeGiH9bNsM=qaJ2bzH9RyOzu3FZpGxsmBsQyxHQMgw@mail.gmail.com>
Message-ID: <20140506143845.0c802ae9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 6 May 2014 14:26:31 +0200, Thomas De Schampheleire wrote:

> > Shouldn't we instead migrate these to use the virtual package
> > infrastructure, and make this infrastructure define this magic 'virtual'
> > version?
> 
> For toolchain and toolchain-buildroot that would be possible, but for
> toolchain-external not, right?

Right. But toolchain-external is not a virtual package, so setting its
version to 'virtual' would anyway be strange, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
