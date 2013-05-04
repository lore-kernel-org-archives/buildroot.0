From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 12:47:44 +0200
Subject: [Buildroot] [PATCH 13/15] manual: add a make target
	'manual-update-lists'
In-Reply-To: <329066ec07dfd91785b949d8f96cca81c2743f0c.1364253936.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 26 Mar 2013 00:28:08 +0100")
References: <cover.1364253936.git.yann.morin.1998@free.fr>
 <cover.1364253936.git.yann.morin.1998@free.fr>
 <329066ec07dfd91785b949d8f96cca81c2743f0c.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <87haijvx67.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: Samuel Martin <s.martin49@gmail.com>
 Yann> The generated lists are automatically updated when building the manual.

 Yann> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Yann> [yann.morin.1998 at free.fr: indentation, remove temp dir, intro to host utils]
 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Yann> ---
 Yann> Changes since v5:
 Yann> * Generate lists in $(O)

 Yann> Changes since v4:
 Yann> * systematically update the generated lists when building the manual

 Yann> Changes since v2:
 Yann> * remove PYTHONPATH stuff since the kconfiglib module is next to
 Yann>   gen-manual-lists.py (Arnout)

 Yann> Changes since v1:
 Yann> * add manual-update-lists target to the .PHONY one (Arnout)
 Yann> * misc. fixes/updates
 Yann> ---
 Yann>  docs/manual/appendix.txt |    2 ++
 Yann>  docs/manual/manual.mk    |   19 ++++++++++++++-----
 Yann>  2 files changed, 16 insertions(+), 5 deletions(-)

 Yann> diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
 Yann> index ffde7e4..779fd2e 100644
 Yann> --- a/docs/manual/appendix.txt
 Yann> +++ b/docs/manual/appendix.txt
 Yann> @@ -19,6 +19,8 @@ include::package-list.txt[]
 Yann>  Host utilities
 Yann>  --------------
 
 Yann> +The folowing packages are all availabel in the menu +Host utilities+.
 Yann> +

s/folowing/following/

s/availabel/available/

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
