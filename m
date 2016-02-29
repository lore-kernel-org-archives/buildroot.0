From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 29 Feb 2016 08:53:08 -0300
Subject: [Buildroot] [v3,
	2/3] util-linux: rework utilities menu for finer control
In-Reply-To: <1436842628-29469-2-git-send-email-danomimanchego123@gmail.com>
References: <1436842628-29469-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1456746788-12410-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> When even a single extra util-linux utility is enabled, the
> default build and install will install many more programs,
> including many that overlap with those offered by busybox.
> 
> Fix by reworking the install-utilies menu to take advantage
> of the new --disable-all-programs config option.  This option
> make it possible to disable the basic set of apps, and then
> enable only the desired apps.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
> 
> Changes v1 -> v2:
>   - Rework to incorporate ideas and suggestions from Thomas Petazzoni
>     and Arnout Vandecappelle.  At least, in spirit.
> 
> Changes v2 -> v3:
>   - Change BR2_PACKAGE_UTIL_LINUX_SELECTED_BINARIES to
>     BR2_PACKAGE_UTIL_LINUX_BINARIES, to conserve backwards-
>     compatibility without need for a legacy option.
>   - Enable 'Basic set' by default to match output of previous
>     build when binaries were selected.

Reviewed-by: Carlos Santos <casantos@datacom.ind.br>

The patch needs to be reworked. It does not apply on top of the master
branch anymore.

-- 
2.5.0
