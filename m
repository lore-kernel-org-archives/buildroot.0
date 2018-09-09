From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 09 Sep 2018 21:03:57 +0200
Subject: [Buildroot] [PATCH] shairport-sync: add upstream patch to fix
 soxr configure issue
In-Reply-To: <20180909151344.2eadead8@windsurf.home>
References: <20180909094317.10873-1-joerg.krause@embedded.rocks>
 <20180909151344.2eadead8@windsurf.home>
Message-ID: <37290764ba05504ae3c5b862de98989528fb35e5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, 2018-09-09 at 15:13 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun,  9 Sep 2018 11:43:17 +0200, J?rg Krause wrote:
> > Commit b06639cf7a adds an upstream patch to fix a build issue with soxr.
> 
> I don't have any commit with the hash b06639cf7a in Buildroot. Are you
> talking about e047dee241fe0660d92311a124757065c6c4c93d instead ?

Sorry. Yes, I am talking about
e047dee241fe0660d92311a124757065c6c4c93d. My bad!

> > Should be committed to 2018.02.x and 2018.05.x, too.
> 
> Well e047dee241fe0660d92311a124757065c6c4c93d was not backported to
> 2018.02.x and 2018.05.x.

The commit for 2018.02.x is 2aafa0366f0fe73afdf97a9a52917b2f1dbdf392
[1] and for 2018.05.x is 72f10180f5cbc6f4f3914e4a142d25e13c322f08

> Are you sure 2018.02.x and 2018.05.x are
> affected by the soxr build issue that
> e047dee241fe0660d92311a124757065c6c4c93d is fixing ? Indeed, I don't
> see any autobuilder failure:
> http://autobuild.buildroot.net/?reason=shairport%.

Peter commited the patch to 2018.02.x and 2018.05.x [3]. You're right,
there aren't any autobuild failures and I didn't checked these branches
for the build failure back then.

[1] https://git.buildroot.net/buildroot/commit/?h=2018.02.x&id=2aafa0366f0fe73afdf97a9a52917b2f1dbdf392
[2] https://git.buildroot.net/buildroot/commit/?h=2018.05.x&id=72f10180f5cbc6f4f3914e4a142d25e13c322f08
[3] https://patchwork.ozlabs.org/patch/962789/

Best regards,
J?rg Krause
