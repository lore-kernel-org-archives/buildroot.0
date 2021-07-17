From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:02:58 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/systemd: bump to version 249
In-Reply-To: <20210717035854.2113295-1-james.hilliard1@gmail.com>
References: <20210717035854.2113295-1-james.hilliard1@gmail.com>
Message-ID: <20210717100258.6c3ecb60@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 16 Jul 2021 21:58:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add config option for systemd-sysext.
> 
> Add config option for systemd-oomd.
> 
> Add new host-python3-jinja2 dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v4 -> v5:
>   - don't enable systemd-oomd by default
> Changes v3 -> v4:
>   - add transient user/groups nsswitch.conf support
> Changes v2 -> v3:
>   - add oomd and sysext configuration options
> Changes v1 -> v2:
>   - add host-python3-jinja2 host-systemd dependency
> ---
>  package/systemd/Config.in    | 24 ++++++++++++++++++++++++
>  package/systemd/systemd.hash |  4 ++--
>  package/systemd/systemd.mk   | 22 ++++++++++++++++++++--
>  3 files changed, 46 insertions(+), 4 deletions(-)

There was a minor formatting problem in the Config.in file, spotted by
"make check-package". I fixed that up when applying. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
