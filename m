From: Scott Fan <fancp2007@gmail.com>
Date: Sat, 20 Mar 2021 12:02:36 +0800
Subject: [Buildroot] [PATCH 3/3] package/open62541: bump version to 1.2
In-Reply-To: <20210316224133.416bd4d1@windsurf.home>
References: <20210220162715.283519-1-fancp2007@gmail.com>
 <20210220162715.283519-3-fancp2007@gmail.com>
 <20210316224133.416bd4d1@windsurf.home>
Message-ID: <CAFkzVZZnyMW0TD0U-E0v1vqrVx0hfMxkLmrETKBxjS2-SzWmhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks, I'll check it out.

Scott Fan


On Wed, Mar 17, 2021 at 5:41 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Sun, 21 Feb 2021 00:27:15 +0800
> Scott Fan <fancp2007@gmail.com> wrote:
>
>
> > diff --git a/package/open62541/open62541.hash
> b/package/open62541/open62541.hash
> > index 3da8c8f5fb..11414085c3 100644
> > --- a/package/open62541/open62541.hash
> > +++ b/package/open62541/open62541.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> 36273793e5247586fadaa73c0edad89be610100cbc839d1fb5f567f20c3cbc44
> open62541-1.0-br1.tar.gz
> > +sha256
> 38a8f9af14548ee9b04655eedb996f741032f7040ff9118bba853c0718d5e978
> open62541-1.2-br1.tar.gz
> >  sha256
> fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
>
> I am afraid this doesn't work here:
>
> >>> open62541 1.2 Downloading
> Reinitialized existing Git repository in
> /home/thomas/dl/open62541/git/.git/
> Fetching all references
> remote: Enumerating objects: 633, done.
> remote: Counting objects: 100% (633/633), done.
> remote: Compressing objects: 100% (10/10), done.
> remote: Total 854 (delta 623), reused 633 (delta 623), pack-reused 221
> Receiving objects: 100% (854/854), 398.44 KiB | 1.26 MiB/s, done.
> Resolving deltas: 100% (673/673), completed with 201 local objects.
> From git://github.com/open62541/open62541
>    33f1885b..f642222c  1.1                 -> origin/1.1
>    def0642c..875d33a9  1.2                 -> origin/1.2
>  * [new branch]        fix_master_backport -> origin/fix_master_backport
>    563b150d..7bde5f2b  master              -> origin/master
>  + 0f26511b...d0fc7ff1 pack/1.1            -> origin/pack/1.1  (forced
> update)
>  * [new tag]           v1.2                -> v1.2
> Fetching submodule deps/ua-nodeset
> From https://github.com/OPCFoundation/UA-Nodeset
>    9c80cf6..9ba5c13  v1.04                -> origin/v1.04
>  * [new tag]         UA-1.04.9-2021-01-21 -> UA-1.04.9-2021-01-21
>  * [new tag]         Machinery-1.01.0-2021-02-25 ->
> Machinery-1.01.0-2021-02-25
> Deregistering submodule "deps/mdnsd"
> Deregistering submodule "deps/ua-nodeset"
> Submodule path 'deps/mdnsd': checked out
> '3151afe5899dba5125dffa9f4cf3ae1fe2edc0f0'
> Submodule path 'deps/ua-nodeset': checked out
> '393b633468a5d1d062dd253e1488d1d8ba335b6f'
> ERROR: open62541-1.2-br1.tar.gz has wrong sha256 hash:
> ERROR: expected:
> 38a8f9af14548ee9b04655eedb996f741032f7040ff9118bba853c0718d5e978
> ERROR: got     :
> 928789032b67e92f0d546aedd521cf91cfb5ca3e12d714cbc01681d0afbda047
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> --2021-03-16 22:40:11--
> http://sources.buildroot.net/open62541/open62541-1.2-br1.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.0.37,
> 104.26.1.37, 172.67.72.56, ...
> Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.0.37|:80...
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2021-03-16 22:40:12 ERROR 404: Not Found.
>
> --2021-03-16 22:40:12--
> http://sources.buildroot.net/open62541-1.2-br1.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 172.67.72.56,
> 104.26.1.37, 104.26.0.37, ...
> Connecting to sources.buildroot.net (sources.buildroot.net)|172.67.72.56|:80...
> connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2021-03-16 22:40:12 ERROR 404: Not Found.
>
> make: *** [package/pkg-generic.mk:148:
> /home/thomas/projets/buildroot/output/build/open62541-1.2/.stamp_downloaded]
> Error 1
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210320/6009327d/attachment.html>
