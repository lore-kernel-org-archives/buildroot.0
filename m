From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:01:37 +0200
Subject: [Buildroot] [PATCH v2 1/6] squashfs: bump version to
 e38956b92f738518c29734399629e7cdb33072d3
In-Reply-To: <20180412205157.3cb10c44@gmx.net>
References: <20180409200429.22650-1-ps.report@gmx.net>
 <20180411211254.GD2328@scaer> <20180412205157.3cb10c44@gmx.net>
Message-ID: <20180412210137.0db909ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 20:51:57 +0200, Peter Seiderer wrote:

> > However, I don't think it is interesting to have the new version
> > (especially as it is a sha1) in the commit title. Having the title
> > read just "squashfs: bump version" is IMHO enough. My rev-by still
> > stands, though.  
> 
> Matter of taste....and looking at a packet history of e.g.:
> 
> 	squashfs: bump version
> 	squashfs: bump version
> 	squashfs: bump version
> 	[...]
> 
> is a little boring and makes every patch search or patch reference
> more difficult....

We normally like to have the version number in the commit title indeed,
like "foo: bump to version 1.2.0". For Git SHA1s, it is a bit more
questionable whether it is really useful or not. Indeed, while with
"bump to version 1.2.0" you can easily say "ah, yes good, they bumped
to that one", with "bump to version
e38956b92f738518c29734399629e7cdb33072d3", you're unlikely to be able
to say "aah very good, they are up to this commit, so they must have
this great new feature". Or if you are, and now all the SHA1s of a
project Git repository, you really have a *very* good memory.

That being said, it doesn't hurt, and we could say that for the sake of
consistency, we should do it for all packages, regardless of whether
they have human-readable version numbers or random SHA1s.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
