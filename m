From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 17:24:09 +0100
Subject: [Buildroot] [PATCH 1/2] aufs-utils: initial release
In-Reply-To: <1406576065-20263-1-git-send-email-mail@steffenhoenig.com>
References: <1406576065-20263-1-git-send-email-mail@steffenhoenig.com>
Message-ID: <20150102172409.7716f157@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear steffenhoenig,

On Mon, 28 Jul 2014 21:34:24 +0200, steffenhoenig wrote:
> Signed-off-by: steffenhoenig <mail@steffenhoenig.com>
> ---
>  package/Config.in                |  1 +
>  package/aufs-utils/Config.in     |  4 ++++
>  package/aufs-utils/aufs-utils.mk | 27 +++++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 package/aufs-utils/Config.in
>  create mode 100644 package/aufs-utils/aufs-utils.mk

I gave some feedback about your patches on November, 23th, and got no
response. Since the patches cannot be applied as is, and nobody has
worked on a version that actually works properly, I'll mark them as
"Changes Requested" in our patch tracking system.

Please resubmit updated versions with the suggested changes if you
want to have aufs supported in Buildroot.

Thanks a lot! 

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
