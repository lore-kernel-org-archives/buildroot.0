From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:58:02 -0500
Subject: [Buildroot] [PATCH] package/dt: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <20191027064930.15811-1-matthew.weber@rockwellcollins.com>
References: <20191027064930.15811-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpaWYsnoaYuSTUWMBNt4bG1jk8+1XgMUFA+c7d19Oyg6NA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Title of this one can drop the github part (cut/paste error)

On Sun, Oct 27, 2019 at 1:49 AM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Fixes version parsing for release-monitoring.org support.
>
> Cc: Heiko Thiery <heiko.thiery@kontron.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/dt/dt.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dt/dt.mk b/package/dt/dt.mk
> index 8ec7788883..1963a7ecc5 100644
> --- a/package/dt/dt.mk
> +++ b/package/dt/dt.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -DT_VERSION = v18.32
> +DT_VERSION = 18.32
>  DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
> -DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
> +DT_SOURCE = dt-source-v$(DT_VERSION).tar.gz
>  DT_STRIP_COMPONENTS = 2
>  DT_LICENSE = ISC-like
>  DT_LICENSE_FILES = LICENSE
> --
> 2.17.1
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
