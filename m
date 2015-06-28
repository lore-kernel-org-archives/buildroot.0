From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 22:57:56 +0200
Subject: [Buildroot] [RFC v4 00/16]  Add per-package staging feature
In-Reply-To: <20150628204912.GF3950@free.fr>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <20150628204622.GE3950@free.fr> <20150628204912.GF3950@free.fr>
Message-ID: <20150628225756.4523f4cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jun 2015 22:49:12 +0200, Yann E. MORIN wrote:

> On 2015-06-28 22:46 +0200, Yann E. MORIN spake thusly:
> > On 2015-06-28 21:42 +0200, Fabio Porcedda spake thusly:
> [--SNIP--]
> > > |  35GB |  99m | master branch
> > > |  37GB | 100m | patch set             
> > > | 153GB | 105m | patch set using hard links only for the toolchain sysroot
> > > | 225GB | 106m | patch set not using hardlinks at all
> [--SNIP--]
> >   - the size overhead is huge, a factor 4.4 with hardlinks, 6.5 without
> >     hardlinks
> 
> Oh wait, I read the wrong line...
> 
> OK, disregard my comments about the size overhead. It's only 2GiB, i.e.
> roughly 5%.

Yes, the size overhead is IMO very reasonable. So do you reconsider the
general opinion you gave in your previous e-mail?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
