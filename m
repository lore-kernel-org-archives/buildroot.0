From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 23:20:04 +0200
Subject: [Buildroot] [PATCH v3] usbip: new package
In-Reply-To: <CAOPBCFUzO64CXWKr4Z2rJeUb2NXExu=H1Gp2QyymrHcjVNaJuA@mail.gmail.com>
References: <CAOPBCFULJTm7iooZ8=nnpMoooaRq=1PK11hhYyyGVr=DdM2e2w@mail.gmail.com>
 <20121226070612.GC7402@sapphire.tkos.co.il>
 <20121226094937.3c2b9383@skate>
 <CAOPBCFUzO64CXWKr4Z2rJeUb2NXExu=H1Gp2QyymrHcjVNaJuA@mail.gmail.com>
Message-ID: <20130813232004.5aca237c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcin Bis,

On Wed, 26 Dec 2012 09:55:47 +0100, Marcin Bis wrote:
> Signed-off-by: Marcin Bis <marcin@bis.org.pl>
> ---
>  package/Config.in       |    1 +
>  package/usbip/Config.in |   33 +++++++++++++++++++++++++++++++++
>  package/usbip/usbip.mk  |   32 ++++++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 0 deletions(-)

Are you still interested in getting usbip packaged in Buildroot? If so,
could you rework your patch to use instead the code bundled with the
kernel in drivers/staging/usbip/userspace, as suggested by Baruch?

The package/perf package provides an example on how to create a package
for a tool whose source code is shipped directly within the kernel
sources.

Since those comments have been made in December 2012, without further
postings from you, I'm marking the patch as "Changes requested" in
patchwork. This means that unless you post an updated version at some
point in the future, we'll no longer have 'usbip' in the list of
patches to integrate.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
