From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 15:07:45 +0100
Subject: [Buildroot] [PATCH v2 2/7] Adding gengetopt
In-Reply-To: <1418398967-2183-3-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
 <1418398967-2183-3-git-send-email-gregd72002@gmail.com>
Message-ID: <20150101150745.032ed18a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 12 Dec 2014 15:42:42 +0000, Gregory Dymarek wrote:
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  package/Config.in                |  1 +
>  package/Config.in.host           |  1 +
>  package/gengetopt/Config.in      |  6 ++++++
>  package/gengetopt/Config.in.host |  6 ++++++
>  package/gengetopt/gengetopt.hash |  1 +
>  package/gengetopt/gengetopt.mk   | 16 ++++++++++++++++
>  6 files changed, 31 insertions(+)
>  create mode 100644 package/gengetopt/Config.in
>  create mode 100644 package/gengetopt/Config.in.host
>  create mode 100644 package/gengetopt/gengetopt.hash
>  create mode 100644 package/gengetopt/gengetopt.mk

Thanks, applied, after doing a number of changes:

    [Thomas:
      - Improve commit log.
      - Remove target variant of the package, not needed as we don't do
        development on the target.
      - Remove Config.in.host option for the package, there is not really
        a need to select it from menuconfig, it's merely a build
        dependency for another package.
      - Fix format of hash file.
      - Fix format of comment header in .mk file.
      - Use BR2_GNU_MIRROR.
      - License is GPLv3+, not GPLv3.
      - Add 'LICENSE' to the license files, as it indicates that the
        license is GPLv3+.
      - Add an explanation about $(MAKE1) being used.]

See the final commit at
http://git.buildroot.net/buildroot/commit/?id=dadd8dd0b913f41faf4412dab8100965bb3fc621.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
