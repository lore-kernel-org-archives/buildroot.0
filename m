From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 21:09:40 +0100
Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the
 formatting of commit titles
In-Reply-To: <20181125161722.GC28830@scaer>
References: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
 <20181125161722.GC28830@scaer>
Message-ID: <20181125210940.2d18852f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Nov 2018 17:17:22 +0100, Yann E. MORIN wrote:

> When I add 'package/' as a prefix, it is not because it is in the
> package subdirectory, but because it is touching a package, as opposed
> to something else, like core stuff or package infrastructures.
> 
> The prefix is a 'semantic' prefix, not a path prefix. A path prefix
> serves no purpose in and of itself.

I don't quite agree. If we really want to use 'semantic' prefix, then
we should do:

	package: foo: bump version to ...

Using 'package/foo' really looks way too much like a path, and
therefore...

> There, I would have sued 'infra/' as a prefix, because it is touching
> the pkg0generic infrastructure, not a package.

this doesn't make much sense to me, because there is nothing named
infra/pkg-generic in the tree. "infra: pkg-generic: " would be OK, but
we have never really used such 'semantic' naming so far.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
