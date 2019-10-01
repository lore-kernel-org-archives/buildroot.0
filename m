From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Oct 2019 15:48:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libev: use host-xxx-package
 macros
In-Reply-To: <CAEyMn7YP5yeXboAgftpDqdPuqu_tjx-ggc1CrSG-DA9+iz7Ciw@mail.gmail.com>
References: <20191001091628.7760-1-heiko.thiery@gmail.com>
 <20191001113705.458ad371@windsurf.home>
 <CAEyMn7YP5yeXboAgftpDqdPuqu_tjx-ggc1CrSG-DA9+iz7Ciw@mail.gmail.com>
Message-ID: <20191001154831.66a185b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 1 Oct 2019 13:24:54 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> I need this(these) library(ies) as a dependency for a tool that is also
> used in the installation step to prepare binary data.
> 
> I detail it is used for the integration of a netconf server. This server
> has to prepare some YANG models during the installation phase where the
> host tool of the sysrep project is needed as requirement.
> 
> I know the better solution would be to only compile the needed tool (that
> in fact does not need the libev and libssh) but the build environment of
> this package has no option to only compile the helper tools.

Is this tool part of a package that you intend to submit in Buildroot ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
