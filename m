From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 23:08:11 +0100
Subject: [Buildroot] [PATCH 1 of 3] manual: remove references to
 uninstall commands
In-Reply-To: <f2f1b59c4cfbf80a1592.1386240846@argentina>
References: <patchbomb.1386240845@argentina>
 <f2f1b59c4cfbf80a1592.1386240846@argentina>
Message-ID: <52A0F94B.1030600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/13 11:54, Thomas De Schampheleire wrote:
> diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
> --- a/docs/manual/package-make-target.txt
> +++ b/docs/manual/package-make-target.txt
> @@ -63,9 +63,7 @@ Additionally, there are some other usefu
>   | +show-depends+    | Displays the dependencies required to build the
>   package
>
> -| +clean+           | Run the clean command of the package, also
> -uninstall the package from both the target and the staging directory; _note
> -that this is not implemented for all packages_
> +| +clean+           | Run the clean command of the package

  The note should stay, I think. Clean is still not implemented for all 
packages. By the way, weren't we going to remove clean as well?

  Regards,
  Arnout

>
>   | +dirclean+        | Remove the whole package build directory


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
