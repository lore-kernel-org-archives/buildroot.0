From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:07:04 +0200
Subject: [Buildroot] [PATCH v2] fb-test-app: Revert upstream 77bdfc6
 "add function to place framebuffer ..."
In-Reply-To: <20190619110543.GB9224@smile.fi.intel.com>
References: <20190618154650.51149-1-andriy.shevchenko@linux.intel.com>
 <20190618195453.0140a482@windsurf>
 <20190619110543.GB9224@smile.fi.intel.com>
Message-ID: <20190619130704.39b323bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 14:05:43 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Jun 18, 2019 at 07:54:53PM +0200, Thomas Petazzoni wrote:
> > On Tue, 18 Jun 2019 18:46:50 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >   
> > > The patch breaks at least hotplug displays to work.
> > > 
> > > More details in submitted PR to the upstream, i.e.
> > > https://github.com/prpplague/fb-test-app/pull/5.  
> > 
> > This link does not exist.  
> 
> First time in my life I see such a reaction to the bug report. So, owner
> basically removed repository completely without any word to say.

Ah, ah, interesting indeed! This is quite surprising from David Anders
to be honest. Perhaps we could contact him separately and see what
happened ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
