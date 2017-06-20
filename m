From: Koen Martens <gmc@sonologic.nl>
Date: Tue, 20 Jun 2017 20:35:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] linuxconsoletools: new package
In-Reply-To: <20170620153544.05bb6470@windsurf.lan>
References: <201706191656.v5JGuLc9093352@mx1.sonologic.net>
 <20170619214458.7fe41175@windsurf.home>
 <87a852g8v0.fsf@dell.be.48ers.dk>
 <20170620150550.7cbbae30@windsurf.lan>
 <87wp86eqzb.fsf@dell.be.48ers.dk>
 <20170620153544.05bb6470@windsurf.lan>
Message-ID: <20170620183514.GA2636@sunra>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 20, 2017 at 03:35:44PM +0200, Thomas Petazzoni wrote:
> On Tue, 20 Jun 2017 15:19:36 +0200, Peter Korsgaard wrote:
> >  > Since linuxconsoletools provides the three utilities provided by
> >  > input-tools, has a name matching the upstream project, and uses a more
> >  > recent version, I would suggest to drop input-tools indeed, and add a
> >  > Config.in.legacy option that automatically enables linuxconsoletools.  
> > 
> > Yes, I agree - The input-tools package is very old and hasn't been
> > updated in close to 10 years.
> > 
> > Will you send a patch to add the legacy handling or should I?
> 
> I wasn't planning on sending such a patch, so feel free to do it :)

If no-one beats me to it, i can create it tomorrow.

- Koen
