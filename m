From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 15:54:46 +0200
Subject: [Buildroot] [PATCH 8/7] package/xenomai: add hash file
In-Reply-To: <1430261200-20963-1-git-send-email-yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <1430261200-20963-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <554385A6.1010904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/15 00:46, Yann E. MORIN wrote:
> Now that custom versions are properly excluded from the list, we can add
> a hash for the version we package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Also verified the .sig file (against Gilles' unfortunately expired key).

 Regards,
 Arnout

> ---
>  package/xenomai/xenomai.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/xenomai/xenomai.hash
> 
> diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
> new file mode 100644
> index 0000000..4d74472
> --- /dev/null
> +++ b/package/xenomai/xenomai.hash
> @@ -0,0 +1,2 @@
> +# Locally computed;
> +sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8  xenomai-2.6.4.tar.bz2
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
