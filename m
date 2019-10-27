From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sun, 27 Oct 2019 15:50:18 +0000
Subject: [Buildroot] [PATCH v2 2/4] package/python3: enable openssl
 support
In-Reply-To: <20191027164142.448565b4@windsurf.dhcp.lyon.intranet>
References: <20191027153853.23532-1-nicolas.carrier@orolia.com>
 <20191027153853.23532-2-nicolas.carrier@orolia.com>
 <20191027164142.448565b4@windsurf.dhcp.lyon.intranet>
Message-ID: <3ffb29aca2a4567927523a2bd47131e0b85ce094.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2019-10-27 at 16:41 +0100, Thomas Petazzoni wrote:
> On Sun, 27 Oct 2019 15:39:08 +0000
> Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
> 
> > If a python script is ran or used as (or in) a custom script like
> > post
> > build, but requires ssl, then it will fail since it's explicitly
> > disabled
> > by default.
> > 
> > This patch enables it unconditionnally.
> > 
> > Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> > 
> > ---
> > 
> > Changes v1 -> v2:
> >   - split the two original patches in two
> >   - removed the ssl support option
> 
> I don't understand. Why did you drop the SSL option ?

We've discussed it a long time with Romain yesterday and ended up
deciding that since usually, there are no options added to host tools,
I wouldn't add one for host python and python 3.

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> ATTENTION: This email came from an external source.
> Do not open attachments or click on links from unknown senders or
> unexpected emails.
