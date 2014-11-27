From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Nov 2014 19:49:59 +0200
Subject: [Buildroot] [PATCH] (e)glibc: add security patches for
 CVE-2014-7817
In-Reply-To: <1417101542-12008-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417101542-12008-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141127174959.GB4690@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Nov 27, 2014 at 12:19:02PM -0300, Gustavo Zacarias wrote:
> 
> diff --git a/package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch b/package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch
> new file mode 100644
> index 0000000..da2f49d
> --- /dev/null
> +++ b/package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch
> @@ -0,0 +1,174 @@
> +From https://bugzilla.redhat.com/show_bug.cgi?id=1157689
> +Modified for eglibc.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +
> +WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!
> +EMBARGOED !!! EMBARGOED !!! EMARGOED !!! EMBARGOED !!! EMBARGOED !!!
> +SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!!

Embargoed? Really?

Anyway, I'm not sure leaving this comment here makes sense.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
