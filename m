From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 21:49:10 +0200
Subject: [Buildroot] [PATCH v2] libinput: remove unneeded patch
In-Reply-To: <8540ba3bf8ab447d57ec3a5c2df6b4cbe22bb25a.1463148086.git.baruch@tkos.co.il>
References: <8540ba3bf8ab447d57ec3a5c2df6b4cbe22bb25a.1463148086.git.baruch@tkos.co.il>
Message-ID: <20160513214910.2a3040cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 17:01:26 +0300, Baruch Siach wrote:
> The log_msg symbol conflict was fixed in libevdev commit e4c315fc1603 (Rename
> symbols leaking from static library to avoid name clashes, 2014-08-18) that
> was included in version 1.3 of libevdev. Remove the patch that used to fix the
> issue of log_msg symbol conflict with libevedev, which is a direct dependency
> of libinput.
> 
> Cc: Romain Naour <romain.naour@openwide.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Clarify how libevedev and libinput relate (Peter, Thomas)
> ---
>  .../0001-rename-log_msg-to-libinput_log_msg.patch  | 77 ----------------------
>  1 file changed, 77 deletions(-)
>  delete mode 100644 package/libinput/0001-rename-log_msg-to-libinput_log_msg.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
