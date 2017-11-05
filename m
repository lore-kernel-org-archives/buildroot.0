From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 15:59:14 +0100
Subject: [Buildroot] [PATCH v1] qt5base: add 3rdparty/harfbuzz-ng
 license file hash
In-Reply-To: <20171023174458.15127-1-ps.report@gmx.net>
References: <20171023174458.15127-1-ps.report@gmx.net>
Message-ID: <0af4065c-c126-fab5-82cc-b95d07114267@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 19:44, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 You're building qt5 on sparc or m68k then? Those are the only platforms where
the internal harfbuzz (and thus this license file) will be used...

 Regards,
 Arnout

> ---
>  package/qt5/qt5base/qt5base.hash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 2a073d4753..4883484d5b 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -11,3 +11,4 @@ sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.
>  sha256 68afaf3392f8c04218fbf29db43cc0b18bf651c1db086556aa584046de9f3e35 LICENSE.LGPLv3
>  sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
>  sha256 8fdefa0b45d9f791f687da6c2c4c83c1b701aaee2c08008f55d522af214b88f0 header.BSD
> +sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
