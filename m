From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:06:13 +0200
Subject: [Buildroot] [PATCH] iproute2: bump to version 4.1.0
In-Reply-To: <1435403732-13992-1-git-send-email-gustavo@zacarias.com.ar>
References: <1435403732-13992-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150628140613.18e3ef29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 27 Jun 2015 08:15:32 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...c-make-build-conditional-on-having-libmnl.patch | 33 ++++++++++++++++++++++
>  package/iproute2/iproute2.hash                     |  2 +-
>  package/iproute2/iproute2.mk                       |  6 +++-
>  3 files changed, 39 insertions(+), 2 deletions(-)
>  create mode 100644 package/iproute2/0001-tipc-make-build-conditional-on-having-libmnl.patch

Applied, thanks. Please remember to submit the libmnl related patch
upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
