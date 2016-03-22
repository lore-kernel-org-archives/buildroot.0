From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:03:44 +0100
Subject: [Buildroot] [PATCH v4 1/2] libgtk3: bump to version 3.18.9
In-Reply-To: <1458561948-13971-2-git-send-email-gustavo@zacarias.com.ar>
References: <1458561948-13971-1-git-send-email-gustavo@zacarias.com.ar>
 <1458561948-13971-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160322100344.3d45d248@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Mar 2016 09:05:47 -0300, Gustavo Zacarias wrote:
> Mark the wayland backend as good again since the bump and consequent
> protocol version match fixes it.
> 
> Drop upstream 0004-Fix-undefined-reference-to-get_xkb.patch
> 
> Drop unnecessary 0005-do-not-build-extract-strings.patch
> (extract-strings doesn't exist any more).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0004-Fix-undefined-reference-to-get_xkb.patch  | 33 --------
>  .../0005-do-not-build-extract-strings.patch        | 47 ------------
>  package/libgtk3/Config.in                          | 88 +++++++++++++---------
>  package/libgtk3/libgtk3.hash                       |  4 +-
>  package/libgtk3/libgtk3.mk                         | 15 +---
>  5 files changed, 57 insertions(+), 130 deletions(-)
>  delete mode 100644 package/libgtk3/0004-Fix-undefined-reference-to-get_xkb.patch
>  delete mode 100644 package/libgtk3/0005-do-not-build-extract-strings.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
