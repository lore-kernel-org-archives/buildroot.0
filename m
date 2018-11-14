From: Nasser Afshin <afshin.nasser@gmail.com>
Date: Wed, 14 Nov 2018 10:48:20 +0330
Subject: [Buildroot] [PATCH v3 0/3] Fix merging configuration fragments
In-Reply-To: <20181113134404.32235-1-afshin.nasser@gmail.com>
References: <20181105083554.GC4485@x230>
 <20181113134404.32235-1-afshin.nasser@gmail.com>
Message-ID: <20181114071819.GB10744@smart-All-Series>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all
On Tue, Nov 13, 2018 at 05:14:01PM +0330, Nasser Afshin wrote:
> From: Nasser Afshin <Afshin.Nasser@gmail.com>
> 
> We use merge_config.sh as a helper script to merge many types of config
> fragments. The script has recently improved to better support buildroot. Now
> the report mechanism (-r -m) works as expected for buildroot configuration
> fragments.
> 
> These are patches to reproduce the state of the Linux Kernel Build
> mainline project.
> 
> 
> Nasser Afshin (3):
>   merge_config.sh: Fix merging buildroot config files
>   test-pkg: Use the correct config prefix when merging
>   merge_config.sh: Avoid false positive matches from comment lines
> 
>  support/kconfig/merge_config.sh                    | 12 ++++++--
>  ...e_config.sh-Allow-to-define-config-prefix.patch | 31 +++++++++++++++++++++
>  ...false-positive-matches-from-comment-lines.patch | 32 ++++++++++++++++++++++
>  support/kconfig/patches/series                     |  2 ++
>  utils/test-pkg                                     |  2 +-
>  5 files changed, 75 insertions(+), 4 deletions(-)
>  create mode 100644 support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch
>  create mode 100644 support/kconfig/patches/21-Avoid-false-positive-matches-from-comment-lines.patch
> 
> -- 
> 2.15.0
> 
This patch series is superseded by a new version.
