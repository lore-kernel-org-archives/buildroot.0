From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:56:54 +0200
Subject: [Buildroot] [PATCH v5] moarvm: new package
In-Reply-To: <1433548025-25414-1-git-send-email-arnout@mind.be>
References: <1433543601-17425-1-git-send-email-arnout@mind.be>
 <1433548025-25414-1-git-send-email-arnout@mind.be>
Message-ID: <20150609235654.052a279a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sat,  6 Jun 2015 01:47:05 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  [use buildroot's libatomic_ops, libuv and host-luajit; add
>   dependencies from libuv]
> ---
> v5 (Arnout): - add dynamic library to to comment
> v4 (Arnout): - use buildroot's libatomic_ops, libuv and host-luajit
>              - add dependencies from libuv
> ---
>  package/Config.in          |  1 +
>  package/moarvm/Config.in   | 19 +++++++++++++++++++
>  package/moarvm/moarvm.hash |  2 ++
>  package/moarvm/moarvm.mk   | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 68 insertions(+)
>  create mode 100644 package/moarvm/Config.in
>  create mode 100644 package/moarvm/moarvm.hash
>  create mode 100644 package/moarvm/moarvm.mk

I've applied, after fixing one little thing.


> diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
> new file mode 100644
> index 0000000..d5cc911
> --- /dev/null
> +++ b/package/moarvm/moarvm.hash
> @@ -0,0 +1,2 @@
> +
> +sha256  828843eb3da020ee24ff83933b63aebf4aa774b815a3dfa3a758d6334779565e  MoarVM-2015.05.tar.gz

The comment on the origin of the hash was missing. Since I couldn't
find it on the website, I simply added "Locally computed", since I also
verified the hash locally.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
