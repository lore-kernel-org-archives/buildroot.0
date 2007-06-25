From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 Jun 2007 10:32:03 +0200
Subject: [Buildroot] [PATCH] fontconfig package : cross-compilation
In-Reply-To: <f0528b5b0706241133v5f294ba0o6117a599a85cc39a@mail.gmail.com>
References: <f0528b5b0706240958h5b0c9148k319aea532df6eda0@mail.gmail.com>
	<f0528b5b0706241133v5f294ba0o6117a599a85cc39a@mail.gmail.com>
Message-ID: <20070625083203.GA5134@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 24, 2007 at 08:33:18PM +0200, Julien Letessier wrote:
>Functionnaly identical patch, slightly simpler.
>Installation directories are also corrected.

Two remarks:
- please push this upstream, too
- please add a patch that does this autoreconf. We should not rely on
  the build-host to have autoconf nor automake installed, i think.

Thanks alot for looking into this!
