From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Jun 2018 15:22:41 +0300
Subject: [Buildroot] [PATCH i-g-t v2 1/1] docs/manual/prerequisite.txt:
In-Reply-To: <20180618121914.11306-1-david.degrave@mind.be>
References: <20180618121914.11306-1-david.degrave@mind.be>
Message-ID: <20180618122241.zpqfurnbhasuclc3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Mon, Jun 18, 2018 at 02:19:14PM +0200, David De Grave (Essensium/Mind) wrote:
> Add required packages to be able to build on Redhat/Debian x86_64 with
> prebuilt x86 tools.
> 
> Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> ---
>  docs/manual/prerequisite.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> index 110fab41fd..e47da09382 100644
> --- a/docs/manual/prerequisite.txt
> +++ b/docs/manual/prerequisite.txt
> @@ -87,3 +87,7 @@ corresponding tool on the host system:
>  * Graph generation tools:
>  ** +graphviz+ to use 'graph-depends' and '<pkg>-graph-depends'
>  ** +python-matplotlib+ to use 'graph-build'
> +
> +* 32-bit compatibility libraries for precompiled executables:
> +** +glibc.i686+ and +zlib.i686+ (Redhat/Fedora)
> +** +libc6:i386+ and +g++-multilib+ (Debian/Ubuntu)

I guess you need to escape somehow the '+' characters in g++-multilib.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
