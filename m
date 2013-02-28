From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 13:20:48 +0100
Subject: [Buildroot] [PATCH] gdb: convert to the package infrastructure
In-Reply-To: <512F4977.6000402@imgtec.com>
References: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <512F0EAD.4080406@mind.be> <512F17B6.70501@imgtec.com>
 <20130228094741.50f605fc@skate> <512F4977.6000402@imgtec.com>
Message-ID: <20130228132048.727cf7fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Hogan,

On Thu, 28 Feb 2013 12:11:35 +0000, James Hogan wrote:

> > Not sure to follow here: Arnout mentions the choice list of gdb
> > versions, which only have a limited number of choices already. If you
> > need Buildroot to use some custom gdb version, then you already have to
> > modify Buildroot anyway. Or maybe I'm missing the point you're making?
> 
> Yes, but the modification is as simple as adding a patch file in the
> right place.

It's still the case here: just add your patch in
package/gdb/<version>/, and that's it.

No?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
