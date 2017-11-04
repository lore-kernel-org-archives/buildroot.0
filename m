From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 4 Nov 2017 20:53:05 +0200
Subject: [Buildroot] [PATCH 1/1] docs: update DEVELOPERS modification
 process
In-Reply-To: <20171103211053.20886-1-joseph.kogut@gmail.com>
References: <20171103211053.20886-1-joseph.kogut@gmail.com>
Message-ID: <20171104185305.5vkjjg6iwrhctcis@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

On Fri, Nov 03, 2017 at 02:10:53PM -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  docs/manual/contribute.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index a58945f395..8bbc2b9eb7 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -260,9 +260,9 @@ options that no longer exist or are no longer needed.
> 
>  If you are interested in getting notified of build failures and of
>  further changes in the packages you added or modified, please add
> -yourself to the DEVELOPERS file. This should be done in a separate
> -patch of the series. See xref:DEVELOPERS[the DEVELOPERS file] for more
> -information.
> +yourself to the DEVELOPERS file. This should be done in the same patch
> +creating or modifying the package. See xref:DEVELOPERS[the DEVELOPERS file]
> +for more information.

Not sure about "or modifying". Mixing a DEVELOPERS update into a random 
package update does not always make sense. The manual only refers to new 
packages/boards. I suggest to drop this sentence entirely, and leave the 
details for the manual.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
