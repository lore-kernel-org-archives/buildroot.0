From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 May 2010 20:21:07 +0200
Subject: [Buildroot] Graphing package dependencies
In-Reply-To: <20100506101437.5e35c795@surf>
References: <20100506101437.5e35c795@surf>
Message-ID: <20100513202107.1b8bfcf3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 May 2010 10:14:37 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Following the question asked by Will yesterday, I just went ahead and
> implement a small tool that generates a graph of dependencies for a
> given package.

I've slightly improved this script, and it is now capable of generating
the dependency graph for a full Buildroot configuration, i.e taking
into account all packages that have been selected.

See http://free-electrons.com/~thomas/buildroot-full-dependencies.pdf
for a fairly large example involving X.org and Gtk.

As always, the code is available in
http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=graph-dependencies.
Besides the modifications in the script itself, the modifications in
the rest of Buildroot are very small.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
