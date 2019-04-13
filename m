From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 15:30:47 +0200
Subject: [Buildroot] [PATCH v4 6/6] qt5: Remove *.la/*.prl fixup script
In-Reply-To: <0735f59d-5c83-152d-0895-23f0213309d6@mind.be>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-7-anaumann@ultratronik.de>
 <502c3f48-3eb7-7d0b-dff6-c00bcbdf9658@andin.de>
 <0735f59d-5c83-152d-0895-23f0213309d6@mind.be>
Message-ID: <20190413153047.1dd4dae9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Apr 2019 15:08:58 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Also, I have not found absolute /usr/lib pathes in any of the prl files
> > without this.  
> 
>  This I can't explain. I've added Thomas in Cc but I doubt that he remembers.

I obviously won't remember more than what the commit history has.
However, this .prl fixup has been added a *long* time ago, I believe
right when qt5 support was introduced. It is very well possible that
things changed since then, making the fixup possibly no longer needed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
