From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Feb 2013 21:18:41 +0100
Subject: [Buildroot] [PATCH 05/11] support: add kconfiglib python module
In-Reply-To: <bd31d6b5313a660aaa80d596fdd3396e6a57751f.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
 <bd31d6b5313a660aaa80d596fdd3396e6a57751f.1361827174.git.s.martin49@gmail.com>
Message-ID: <512D18A1.3060308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/13 22:31, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>   support/pym/kconfiglib.py | 3772 +++++++++++++++++++++++++++++++++++++++++++++
>   support/pym/readme        |   14 +
>   2 files changed, 3786 insertions(+)
>   create mode 100644 support/pym/kconfiglib.py
>   create mode 100644 support/pym/readme
>
> diff --git a/support/pym/kconfiglib.py b/support/pym/kconfiglib.py
> new file mode 100644

  If you would put it in the same location as the gen-manual-lists.py 
script, then you don't need to mess with PYTHONPATH (the module's 
directory is always in PYTHONPATH).

[snip]

> diff --git a/support/pym/readme b/support/pym/readme
> new file mode 100644

  Obviously, if it moves from pym to scripts, it should be called 
README.kconfiglib or something similar.

> index 0000000..f44609c
> --- /dev/null
> +++ b/support/pym/readme
> @@ -0,0 +1,14 @@
> +Readme
> +======
> +
> +Kconfiglib
> +----------
> +
> +This is a python module fetched from:
> +
> +https://github.com/ulfalizer/Kconfiglib
> +commit: 417d62d1bf5fbfc7271c9d9b8dc2661b6332e288
> +
> +This module is not released under any explicit license, but it is a fair
> +asumption kconfiglib is released under the same license as the linux kernel,
> +i.e. GPLv2.

  Unfortunately, that's not a fair assumption... Perhaps we should mail 
the guy to verify.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
