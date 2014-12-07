From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:12:37 +0100
Subject: [Buildroot] [PATCH] package: add python-psutil
In-Reply-To: <1417596171-10284-1-git-send-email-peter@korsgaard.com>
References: <1417596171-10284-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141207231237.36862b6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed,  3 Dec 2014 09:42:51 +0100, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-psutil/Config.in          |  8 ++++++++
>  package/python-psutil/python-psutil.hash |  3 +++
>  package/python-psutil/python-psutil.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-psutil/Config.in
>  create mode 100644 package/python-psutil/python-psutil.hash
>  create mode 100644 package/python-psutil/python-psutil.mk

Applied after tweaking the commit title, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
