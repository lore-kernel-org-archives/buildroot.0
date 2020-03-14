From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:38:25 +0100
Subject: [Buildroot] [PATCH v4 2/2] package/linuxptp: rename systemd
 service scripts
In-Reply-To: <20200312190434.973-3-heiko.thiery@gmail.com>
References: <20200312190434.973-1-heiko.thiery@gmail.com>
 <20200312190434.973-3-heiko.thiery@gmail.com>
Message-ID: <20200314153825.6b2e8a26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 20:04:36 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Use the same name as for the SysVinit scripts. This name is also used in
> debian.
> 
> linuxptp-system-clock.service -> phc2sys.service
> linuxptp.service -> ptp4l.service
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Tested-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/linuxptp/linuxptp.mk                              | 8 ++++----
>  .../{linuxptp-system-clock.service => phc2sys.service}    | 2 +-
>  package/linuxptp/{linuxptp.service => ptp4l.service}      | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  rename package/linuxptp/{linuxptp-system-clock.service => phc2sys.service} (89%)
>  rename package/linuxptp/{linuxptp.service => ptp4l.service} (87%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
