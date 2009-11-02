From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2009 00:24:42 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <20091029163916.49c81f50@surf>
References: <20091025224056.59c9a6ef@surf> <20091027090628.0aa7b0df@surf>
	<20091029163916.49c81f50@surf>
Message-ID: <20091103002442.4c9f0288@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 29 Oct 2009 16:39:16 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> I've pushed more changes. Since my previous e-mails, the changes are
> the following :

I've pushed even more changes. Mostly conversion of packages to the new
autotargets host infrastructure, which simplifies a lot of existing
makefiles.

See
http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=package-infrastructure
for details.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
