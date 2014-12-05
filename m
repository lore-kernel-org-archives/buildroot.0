From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 23:47:32 +0100
Subject: [Buildroot] [PATCH] package: add python-psutil
In-Reply-To: <1417596171-10284-1-git-send-email-peter@korsgaard.com>
References: <1417596171-10284-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141205234732.1434230d@free-electrons.com>
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

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 (code reviewed, license checked, built and runtime tested on
 ARM/uClibc)

Note however that the commit title for package additions should
normally be "<pkg>: new package", but it can be fixed while applying,
of course :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
