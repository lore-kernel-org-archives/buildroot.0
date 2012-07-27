From: Richard Braun <rbraun@sceen.net>
Date: Fri, 27 Jul 2012 10:53:50 +0200
Subject: [Buildroot] [PATCH] Added local package support.
In-Reply-To: <20120727101253.15d1af71@skate>
References: <20120724042408.GA11558@sapphire.tkos.co.il>
 <1343247448-19993-1-git-send-email-avishorp@gmail.com>
 <50107EAF.3030302@mind.be>
 <CAMkyJgA3+icHUKQ6AS==QQG--RuuptTjgy3KSdJvcwiAPxF3Rg@mail.gmail.com>
 <50124C6D.8050608@mind.be> <20120727101253.15d1af71@skate>
Message-ID: <20120727085350.GA8573@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 27, 2012 at 10:12:53AM +0200, Thomas Petazzoni wrote:
> Le Fri, 27 Jul 2012 10:08:13 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> >   What do the others think?
> 
> I am also a bit skeptical, but it's not yet a final and definitive
> opinion. Custom packages is one thing, but one also very often need to
> put stuff in board/ to keep kernel config, patches and various other
> stuff, though it's true nothing prevent you to use $(TOPDIR)/../ to
> keep track of all those things.

I don't really see the point of the feature either. Keeping custom files
in board and local packages in package/<company>/ is very easy to do and
should suit most people fine. Local packages (those that use the local
method) have one purpose : ease software development through the
buildroot environment. I don't think people spend that much time on the
.mk or Config.in files when using local packages. They spend time on
the packaged software itself.

-- 
Richard Braun
