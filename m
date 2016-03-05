From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 5 Mar 2016 16:56:33 +0100
Subject: [Buildroot] Best regards
In-Reply-To: <1456883894-25867-2-git-send-email-rprebello@gmail.com>
References: <1456883894-25867-1-git-send-email-rprebello@gmail.com>
 <1456883894-25867-2-git-send-email-rprebello@gmail.com>
Message-ID: <56DB01B1.7060708@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rodrigo,

Le 02/03/2016 02:58, Rodrigo Rebello a ?crit :
> This commit adds a backported upstream patch which modifies the
> configure script so that it uses pkg-config to detect libraries and
> their static linking dependencies.
> 
> It also adds host-pkgconf as a dependency and removes the SDL static
> linking workaround from chocolate-doom.mk as it's no longer necessary.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d98/d981499ad82121d58fb7584b55d09c484cb6aa49/
>   http://autobuild.buildroot.net/results/e41/e419f29e14edd28cbf48278bef725b696ae8ef70/
>   http://autobuild.buildroot.net/results/d8f/d8fe9b5bdb262e939d4150804ea34777c91d3c04/
>   ...
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add host-pkgconf to CHOCOLATE_DOOM_DEPENDENCIES (Thomas Petazzoni)
>   - Remove no longer needed SDL static linking workaround
> 
> Changes v2 -> v3:
>   - Fix typo in commit message (s/chocokate/chocolate/)
> ---

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
