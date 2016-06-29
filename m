From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jun 2016 17:01:59 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: allow crosstool-ng musl
 toolchains
In-Reply-To: <CA+-urNSsOA8bDca-JyW7fZrLcAKWvkVpQaSqobrzD=CqOD2t_g@mail.gmail.com>
References: <1466530603-6041-1-git-send-email-fhunleth@troodon-software.com>
 <20160628182415.42ef8e25@free-electrons.com>
 <CA+-urNSsOA8bDca-JyW7fZrLcAKWvkVpQaSqobrzD=CqOD2t_g@mail.gmail.com>
Message-ID: <20160629170159.17cf9769@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Jun 2016 10:45:32 -0400, Frank Hunleth wrote:

> > Thanks for this patch. However, I dislike a bit this test: the test
> > that libm exists is not super great, and we're really looking at
> > consequences of having musl, and not whether we're using musl or not.  
> 
> I completely agree. The original test didn't seem like the best test
> for musl, and I like your idea of verifying the linkage of a short C
> program.
> 
> I'm quite busy at the moment, but as soon as I free up, I'll play
> around with it and post a revision.

Great, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
