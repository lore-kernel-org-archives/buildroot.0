From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Feb 2017 18:23:25 +0100
Subject: [Buildroot] [PATCH] package/sngrep: add missing ncurses
 dependencies
In-Reply-To: <17795fb2-39c2-fe6d-5573-58fc0b4f6c94@gmail.com>
References: <20170218154333.24496-1-romain.naour@gmail.com>
 <20170218164928.59e0f1c5@free-electrons.com>
 <17795fb2-39c2-fe6d-5573-58fc0b4f6c94@gmail.com>
Message-ID: <20170218182325.02536ab8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 17:03:47 +0100, Romain Naour wrote:

> > However, I still don't understand how it can fail on the autobuilders.
> > Have you been able to reproduce the issues locally?  
> 
> Yes, I'm able to reproduce the issues locally and I had to add these two
> variables to fix these two issues...

I don't understand how the issue can occur. Indeed, even if those
sub-options are *NOT* enabled, the corresponding libraries are
installed in staging.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
