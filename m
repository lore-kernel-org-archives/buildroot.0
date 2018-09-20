From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:12:09 +0200
Subject: [Buildroot] [PATCH 13/14] package/alljoyn-base: URL update
In-Reply-To: <CANQCQpZcd3ZXHtTDaDY-OvabUXdM-42szeBA=ynX=hvxyL7ezg@mail.gmail.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-13-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920220404.77a13cdd@windsurf>
 <CANQCQpZcd3ZXHtTDaDY-OvabUXdM-42szeBA=ynX=hvxyL7ezg@mail.gmail.com>
Message-ID: <20180920231209.7caaf3f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 15:44:54 -0500, Matthew Weber wrote:

> >  - The .mk files still use a mirror of allseenalliance at kernel.org,
> >    it should be changed to use the Github location instead.  
> 
> I don't have a good use case to runtime test making this change.  I
> can make it an verified the build is still good.

I think we should try to keep using the same versions (we use 16.04,
and I saw it was available on Github as well), and preferably try to
diff the source code between the old upstream and the new upstream. If
the code is reasonably similar, then build testing should be sufficient.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
