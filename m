From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2009 09:06:28 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <20091025224056.59c9a6ef@surf>
References: <20091025224056.59c9a6ef@surf>
Message-ID: <20091027090628.0aa7b0df@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 25 Oct 2009 22:40:56 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> I've already started prototyping a solution, but I'm facing a choice
> on which I'd like to have the community opinion. Usually, I don't like
> talking without showing patches, but as this choice is fairly
> intrusive in the design of the new infrastructure, I don't want to
> start the wrong way.

I've pushed a set of commits to
http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=package-infrastructure
which shows the current status of my work. Warning: it is currently in
an ugly state: documentation not updated, the generic package
infrastructure still contains some autotools-specific stuff, the
autotools infrastructure ported over the generic infrastructure does
not work yet.

But it still allows you to see how the .mk files look like for three
examples : icu, zlib and olsr (randomly choosen).

Please do not pull this branch anywhere except for experimentations, as
I will rebase it heavily.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
