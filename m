From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 23:50:55 +0100
Subject: [Buildroot] [PATCH 1/1] chdkptp CLI added
In-Reply-To: <1387798250-2437-2-git-send-email-matthew.j.urry@gmail.com>
References: <1387798250-2437-1-git-send-email-matthew.j.urry@gmail.com>
 <1387798250-2437-2-git-send-email-matthew.j.urry@gmail.com>
Message-ID: <20140307235055.494ef4e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Urry,

On Mon, 23 Dec 2013 11:30:50 +0000, Matthew Urry wrote:
> 
> Signed-off-by: Matthew Urry <matthew.j.urry@gmail.com>
> ---
>  package/Config.in                                  |    1 +
>  package/chdkptp/Config.in                          |   15 +++++++++++
>  .../chdkptp-01-add_lm_flag_to_makefile.patch       |   15 +++++++++++
>  ...ptp-02-create_sh_script_to_launch_chdkptp.patch |   22 ++++++++++++++++
>  package/chdkptp/chdkptp.mk                         |   27 ++++++++++++++++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 package/chdkptp/Config.in
>  create mode 100644 package/chdkptp/chdkptp-01-add_lm_flag_to_makefile.patch
>  create mode 100644 package/chdkptp/chdkptp-02-create_sh_script_to_launch_chdkptp.patch
>  create mode 100644 package/chdkptp/chdkptp.mk

You received some review on this patch on December, 28th 2013,
suggesting several improvements to make your patch acceptable upstream.
Your contributions are definitely welcome, but if you want to get it
accepted, it'd be nice if you could resend a new version that takes
into account the comments that have been made.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
