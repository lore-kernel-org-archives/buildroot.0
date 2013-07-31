From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:14:50 +0200
Subject: [Buildroot] [PATCH 1/3] Add libassuan IPC library
In-Reply-To: <1362145109-32509-1-git-send-email-claves@budelmann-elektronik.com>
References: <20130301111856.4753d13b@skate>
 <1362145109-32509-1-git-send-email-claves@budelmann-elektronik.com>
Message-ID: <20130731181450.1b0ac7f3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philipp Claves,

On Fri,  1 Mar 2013 14:38:27 +0100, Philipp Claves wrote:
> Signed-off-by: Philipp Claves <claves@budelmann-elektronik.com>
> ---
>  package/Config.in              |  1 +
>  package/libassuan/Config.in    | 10 ++++++++++
>  package/libassuan/libassuan.mk | 15 +++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/libassuan/Config.in
>  create mode 100644 package/libassuan/libassuan.mk

I finally merged your libassuan, libgpgme and opkg signature support
patches.

Thanks for your contribution,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
