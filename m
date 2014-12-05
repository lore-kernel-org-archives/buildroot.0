From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 23:46:29 +0100
Subject: [Buildroot] [PATCH] package: add python-ipaddr
In-Reply-To: <1417524985-22499-1-git-send-email-peter@korsgaard.com>
References: <1417524985-22499-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141205234629.386e89dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue,  2 Dec 2014 13:56:25 +0100, Peter Korsgaard wrote:
> The functionality is included in python3 as the ipaddress module, so make it
> python2 only.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-ipaddr/Config.in          |  9 +++++++++
>  package/python-ipaddr/python-ipaddr.hash |  3 +++
>  package/python-ipaddr/python-ipaddr.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-ipaddr/Config.in
>  create mode 100644 package/python-ipaddr/python-ipaddr.hash
>  create mode 100644 package/python-ipaddr/python-ipaddr.mk

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
