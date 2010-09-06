From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Sep 2010 20:21:46 -0700
Subject: [Buildroot] Configuring host-lzo fails
In-Reply-To: <20100821180145.1e51ced9@surf>
References: <201007272333.09640.PeterHuewe@gmx.de>
	<20100813122600.3d227eb3@surf> <4C6C51CE.5020409@gmx.net>
	<4C6FE59A.8020306@gmx.net> <20100821180145.1e51ced9@surf>
Message-ID: <20100906032146.GA5320@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On (21/08/10 18:01), Thomas Petazzoni wrote:
> On Sat, 21 Aug 2010 16:41:30 +0200
> Ossy <ossy1980@gmx.net> wrote:
> 
> > The same patch applied, I ran into an error with expat today:
> > configure: error: no acceptable ld found in $PATH
> > make: *** 
> > [/home/ossy/buildroot/buildroot-dev/output/build/expat-2.0.1/.stamp_configured] 
> > Fehler 1
> > 
> > After make flush; make the system build went on without problems.
> 
> When something doesn't work, then you do "make flush" and then it
> works, it means that you've hit a configuration cache issue.
> 
> I'm more and more tempted to disable this configuration cache feature.
> According to the autoconf maintainers, it could theorically work, but
> in practice, there's no real convention on the variable name/value
> stored in the configuration cache, so re-using the cache between
> different packages is going to cause a lot of troubles. As we are
> seeing.

yes thats very true. 

-Khem
