From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 18:09:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] ipmiutil: new package
In-Reply-To: <1412780403-11092-2-git-send-email-david.bachelart@bbright.com>
References: <1412780403-11092-1-git-send-email-david.bachelart@bbright.com>
 <1412780403-11092-2-git-send-email-david.bachelart@bbright.com>
Message-ID: <20150404180930.7555fefa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

On Wed,  8 Oct 2014 17:00:03 +0200, David Bachelart wrote:
> 
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> ---
>  package/Config.in            |    1 +
>  package/ipmiutil/Config.in   |   16 ++++++++++++++++
>  package/ipmiutil/ipmiutil.mk |   15 +++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 package/ipmiutil/Config.in
>  create mode 100644 package/ipmiutil/ipmiutil.mk

Applied, after doing a number of changes:

    [Thomas:
      - remove dependency on SSP support by adding a patch that changes
        the configure.ac script stack protector test to actually work.
      - rewrap Config.in help text
      - fix how BR2_USE_MMU is used when displaying the comment.
      - fix the license, it's BSD-3c, not BSD-2c.
      - bump to version 2.9.5.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
