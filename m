From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:42:36 +0200
Subject: [Buildroot] [PATCH] glib-networking: bump to version 2.42.1
In-Reply-To: <1427804681-23162-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427804681-23162-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150331234236.4c16cfe2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 31 Mar 2015 09:24:41 -0300, Gustavo Zacarias wrote:
> Add hash file and drop libgcrypt tweak since it's no longer required.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glib-networking/glib-networking.hash |  2 ++
>  package/glib-networking/glib-networking.mk   | 11 ++---------
>  2 files changed, 4 insertions(+), 9 deletions(-)
>  create mode 100644 package/glib-networking/glib-networking.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
