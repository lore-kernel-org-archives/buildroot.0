From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 07 Oct 2009 18:32:23 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091007162422.GI10261@mx.loc>
References: <20091007162422.GI10261@mx.loc>
Message-ID: <1254933143.18927.5.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2009-10-07 at 18:24 +0200, Bernhard Reutner-Fischer wrote:

> # roll a release tarball, in gz, bz2, xz format
> release:

That target is usually called 'dist'. At least that's what automake puts
in your Makefile...


Sven
