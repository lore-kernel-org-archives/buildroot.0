From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 19:54:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.52.4
In-Reply-To: <20210703154822.2026244-1-fontaine.fabrice@gmail.com>
References: <20210703154822.2026244-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718195401.1a488d4e@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat,  3 Jul 2021 17:48:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update patch
> 
> This will fix the following build failure with gssdp 1.2.3 which is
> raised since commit 7a2f73e9930d3e46f1530aa865675439adc0e162:
> 
> FAILED: vala/gssdp-1.2.vapi
> /home/buildroot/autobuild/run/instance-1/output-1/host/bin/vapigen --quiet --library=gssdp-1.2 --directory=/home/buildroot/autobuild/run/instance-1/output-1/build/gssdp-1.2.3/build/vala --pkg=gio-2.0 --pkg=libsoup-2.4 --metadatadir=/home/buildroot/autobuild/run/instance-1/output-1/build/gssdp-1.2.3/vala /home/buildroot/autobuild/run/instance-1/output-1/build/gssdp-1.2.3/build/libgssdp/GSSDP-1.2.gir
> GSSDP-1.2.gir:1656.5-1656.29: error: unknown child element `docsection' in `namespace'
> 
> https://github.com/GNOME/vala/blob/0.52.4/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e531029f75c8d6886f797b5bd01795d16f6848f3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-dont-add-dirty-to-valac-version.patch  | 17 ++++++++++-------
>  package/vala/vala.hash                          |  4 ++--
>  package/vala/vala.mk                            |  4 ++--
>  3 files changed, 14 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
