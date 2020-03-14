From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:14:03 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/linphone: bump to version 4.3.1
In-Reply-To: <20200313215015.1437465-1-fontaine.fabrice@gmail.com>
References: <20200313215015.1437465-1-fontaine.fabrice@gmail.com>
Message-ID: <20200314151403.7ecd5a52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Mar 2020 22:50:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to get latest release
> - License is GPL-3.0+ since version 4.3.0 and
>   https://gitlab.linphone.org/BC/public/liblinphone/commit/2bc924c184e2f00f1be3f82a736bccaeacce106e
> - Switch to cmake-infrastructure
> - Remove most of the existing dependencies (alsa, speex, libupnp, ...)
>   as they are now only managed in mediatreamer
> - Add external dependencies: belr, belle-sip, libxml2, mediastreamer,
>   sqlite
> - This bump is needed as current linphone does not build with latest
>   libeXosip2
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ed8bdcbfb7d453ed7d436bada35417ee305e6ac9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Drop unneeded libgtk2 dependency
>  - No change made on video support as video was never supported in
>    buildroot as stated in Config.in and in commit history

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
