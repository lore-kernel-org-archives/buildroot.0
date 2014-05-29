From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 May 2014 13:20:36 +0200
Subject: [Buildroot] [PATCH 3/3] gettext: optimize build time
In-Reply-To: <20140529105623.GN20069@tarshish>
References: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401360028-10423-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140529105623.GN20069@tarshish>
Message-ID: <20140529132036.3b24cc80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 29 May 2014 13:56:23 +0300, Baruch Siach wrote:

> > Thanks to these changes, the build time of gettext goes from 1 minutes
> > and 37 seconds to just 24 seconds, and the build of host-gettext goes
> > from 2 minutes and 18 seconds to 1 minute and 13 seconds.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  .../gettext-03-option-to-disable-tools.patch       | 42 ----------------------
> 
> Why not remove --disable-tools from GETTEXT_CONF_OPT then?

Indeed, thanks for noticing. I'll fix that up in v2.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
