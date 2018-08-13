From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:31:10 +0200
Subject: [Buildroot] [PATCH 10/17] perl-module-implementation: new
 package
In-Reply-To: <20180811182749.20924-11-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-11-chrismcc@gmail.com>
Message-ID: <20180813233110.6af5035d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Aug 2018 11:27:42 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/perl-module-implementation/Config.in               |  8 ++++++++
>  .../perl-module-implementation.hash                        |  6 ++++++
>  .../perl-module-implementation.mk                          | 14 ++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/perl-module-implementation/Config.in
>  create mode 100644 package/perl-module-implementation/perl-module-implementation.hash
>  create mode 100644 package/perl-module-implementation/perl-module-implementation.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
