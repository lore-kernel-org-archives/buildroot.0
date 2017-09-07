From: Sven Haardiek <sven.haardiek@greenbone.net>
Date: Thu, 7 Sep 2017 08:09:12 +0200
Subject: [Buildroot] [PATCH 1/1] Update lcdproc version
In-Reply-To: <20170906231408.58854606@windsurf.lan>
References: <20170906164855.65d6e474@vomer.devel.greenbone.net>
 <20170906231408.58854606@windsurf.lan>
Message-ID: <20170907080912.71525e22@vomer.devel.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 6 Sep 2017 23:14:08 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

Hej Thomas,

> Hello Sven,
> 
> On Wed, 6 Sep 2017 16:48:55 +0200, Sven Haardiek wrote:
> > Patch title: Update lcdproc version
> > 
> > There is a newer version of lcdproc available and it seems like
> > lcdproc moved to github.
> > 
> > The new version also compiles with musl without any patches.
> > 
> > Signed-off-by: Sven Haardiek <sven.haardiek@greenbone.net>
> > ---
> >  package/lcdproc/0002-musl.patch | 102
> > ----------------------------------------
> > package/lcdproc/lcdproc.hash    |   1 +
> > package/lcdproc/lcdproc.mk      |   4 +- 3 files changed, 3
> > insertions(+), 104 deletions(-) delete mode 100644
> > package/lcdproc/0002-musl.patch  
> 
> I've applied your patch to master, thanks!

Great, thanks!

> I only tweaked a bit the
> commit title and commit log. Indeed, your commit titles should always
> look like:
> 
> 	<package>: <description>
> 
> so, something like:
> 
> 	lcdproc: bump version to 0.5.9
> 

Okay. I will to this next time.

> Also, since you are interested in lcdproc, would you accept to be
> listed in the DEVELOPERS file for this package? This would mean you
> would receive patches sent by others for this package, you would
> receive notifications when this package causes some build failures,
> and generally be a contact if we have questions/issues in terms of
> maintaining this package.

Yes, I am happy if I can help. But to be clear, I am not a
developer of lcdproc upstream. Just a user.

Regards,
Sven

> 
> Thanks a lot in advance!
> 
> Thomas
