From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 08:43:33 +0200
Subject: [Buildroot] [PATCH v2 12/14] gst1-plugins-base: add missing
 license file hash
In-Reply-To: <20180927221833.5604b006@gmx.net>
References: <20180925203618.23192-1-ps.report@gmx.net>
 <20180925203618.23192-12-ps.report@gmx.net>
 <20180925231434.5e016ac4@windsurf>
 <20180927221833.5604b006@gmx.net>
Message-ID: <20180928084333.38479bd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Sep 2018 22:18:33 +0200, Peter Seiderer wrote:

> > I'm not sure why you're dropping this hash. The COPYING file still
> > exists, it still has the same hash, and you didn't mention it in your
> > commit log. So I've reverted this part of the change when applying.  
> 
> Sorry for not mentioning in the commit log, the reasoning was that COPYING is
> never reverenced in the gst1-plugins-base.mk file...

Ah, OK. Is this a bug of our .mk file, or nothing is really licensed
under the license described in COPYING ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
