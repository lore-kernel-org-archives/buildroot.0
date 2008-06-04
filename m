From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 4 Jun 2008 16:49:21 +0200
Subject: [Buildroot] root fs
In-Reply-To: <d6cda7730806040711j4cd573ej2001550ff6bc26a2@mail.gmail.com>
References: <2590773a0806031618y36f52acdub806d896da6ad0ae@mail.gmail.com>
	<6306c640806031730n7b1a0ffayece31eb66d657615@mail.gmail.com>
	<326f33790806031753o781d8638l804bbbf9da3001ec@mail.gmail.com>
	<2590773a0806031759j7ea229e6l797fd9250c6f3243@mail.gmail.com>
	<d6cda7730806040711j4cd573ej2001550ff6bc26a2@mail.gmail.com>
Message-ID: <20080604144921.GB28895@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 04, 2008 at 11:11:42AM -0300, Thiago A. Corr?a wrote:
>What I do is rm -rf build_* toolchain_* binaries project_*

a
realclean:
	rm -rf build_* toolchain_* project_*

would really be handy, i agree. Note that this does not wipe binaries.
>
>Except for the config, this pretty much resets everything back to
>checkout state.
