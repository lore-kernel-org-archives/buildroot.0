From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 11 Feb 2010 09:49:04 -0600
Subject: [Buildroot] asterisk works in buildroot?
In-Reply-To: <20100211163547.66d65e17@surf>
References: <e42c80a1002110658y6dd628bbg419a1062d8f8019@mail.gmail.com>
	<20100211163547.66d65e17@surf>
Message-ID: <201002110949.08294.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu February 11 2010, Thomas Petazzoni wrote:
> Hello Makis,
> 
> On Thu, 11 Feb 2010 16:58:07 +0200
> Makis Tsimaras <tsigian@gmail.com> wrote:
> 
> > My question is that is the "depends on BROKEN" line in the
> > "package/multimedia/asterisk/Config.in" means that asterisk cannot
> > compile and work with Buildroot at all?
> 
> It was marked BROKEN because it was known not to work and nobody was
> working on getting it working. As it was marked BROKEN since a long
> time, Peter Korsgaard (Buildroot maintainer) recently removed asterisk
> from the list of available packages.
> 
> However, this does not mean that Asterisk cannot be built at all with
> Buildroot. It just means that someones needs to make the integration.
> So you have basically two choices:
> 
>  1) Do the work by yourself if you have the skills and the time.
> 
>  2) Hire a consultant with expertise in Buildroot to do the
>     integration. It happens that I'm both a Buildroot developer and a
>     consultant :-)
> 

Yeah, except then the work would be a "work for hire" and the property of
whoever pays your fee - not an improvement to the open source Buildroot system.

Such "improvements" and "integrations" might well take years before the owner
released the work for inclusion into Buildroot.

One of the legal and ethical problems faced by any "loss leader" OSS project
used to promote the commercial agenda of private development firms.
Buildroot is hardly the first to try that idea.

Mike

> Cheers!
> 
> Thomas
