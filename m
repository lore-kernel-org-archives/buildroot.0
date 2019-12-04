From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Dec 2019 13:58:46 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: fix runtime issue with
 Python 3
In-Reply-To: <8a33063f-ca07-6c59-58fe-27cd3c1894ed@mind.be>
References: <20191203165137.1100010-1-thomas.petazzoni@bootlin.com>
 <1a56a5b4-e64b-3844-7352-d12c6407585b@mind.be>
 <20191203205836.66e9c82a@windsurf>
 <8a33063f-ca07-6c59-58fe-27cd3c1894ed@mind.be>
Message-ID: <20191204135846.5ec63e41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Dec 2019 13:52:48 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > and I indeed noticed the issue with Python 3.x because I started using
> > genrandconfig on my updated Fedora system, which now uses Python 3.x as
> > "python".
> >   
> >> , nobody noticed that this broke when I switched to
> >> reading from file instead of URL two years ago (84929a53a4).  
> > 
> > Indeed. I'll update the commit log and resend.  
> 
>  Didn't I mention that I already merged it?

You did, but I saw it after replying to this e-mail :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
