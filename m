From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 09:31:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/xen: Disable strict
 unused-const-variable checking
In-Reply-To: <CAKmqyKM0RTciLxjAkJ5DnZsq9yON3Er9XdwXMpd9E-CpQqsAYQ@mail.gmail.com>
References: <1481140097-32096-1-git-send-email-alistair.francis@xilinx.com>
 <1481140097-32096-3-git-send-email-alistair.francis@xilinx.com>
 <20161207215039.1accb7ba@free-electrons.com>
 <CAKmqyKM0RTciLxjAkJ5DnZsq9yON3Er9XdwXMpd9E-CpQqsAYQ@mail.gmail.com>
Message-ID: <20161208093148.78bcb271@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Dec 2016 15:39:26 -0800, Alistair Francis wrote:

> >
> > What is this patch fixing? The commit log shouldn't be empty.
> >
> > Is this fixing an autobuilder issue? If so, there should be a reference
> > to it.  
> 
> It is fixing an autobuilder issue, I have added a commit message with
> more details.

Good, but you still forgot (in your v2) a link to the autobuilder issue
being fixed. See
https://git.buildroot.org/buildroot/commit/?id=041c717ec8c251b7bca675086510840f02274967
for an example of how we reference autobuilder issues.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
