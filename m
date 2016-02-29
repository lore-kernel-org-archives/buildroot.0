From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:31:22 +0100
Subject: [Buildroot] [PATCH/next v9 26/28] package/freeswitch: enable
 mod_imagick, add optional dependencies to imagemagick, libvpx & libyuv
In-Reply-To: <1456586838-21197-27-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
 <1456586838-21197-27-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229223122.500e4b53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 27 Feb 2016 16:27:16 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/freeswitch/freeswitch.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Small typo in the commit log: "enable mod_imagick" -> "enable
mod_imagemagick".

The commit title is slightly too long. Ideally for such commits, it
should be:

"""
package/freeswitch: enable mod_imagemagick

This commit enables mod_imagemagick, which requires imagemagick, libvpx
and libyux as optional dependencies.
"""

(There is the same issue in other patches in your series, though this
is really a minor nit)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
