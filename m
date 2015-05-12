From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 May 2015 13:18:49 +0200
Subject: [Buildroot] [PATCH] package: add host-faketime
In-Reply-To: <1431420691-5258-1-git-send-email-peter@korsgaard.com>
References: <1431420691-5258-1-git-send-email-peter@korsgaard.com>
Message-ID: <20150512131849.6f20114d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 12 May 2015 10:51:31 +0200, Peter Korsgaard wrote:
> For use by packages or post-build/image scripts to fake the current time for
> obnoxious programs that insists on adding a timestamp.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in.host          |  1 +
>  package/faketime/Config.in.host |  7 +++++++
>  package/faketime/faketime.mk    | 20 ++++++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/faketime/Config.in.host
>  create mode 100644 package/faketime/faketime.mk

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
