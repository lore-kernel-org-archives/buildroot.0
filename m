From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 23:45:59 +0100
Subject: [Buildroot] [PATCH] package: add python-alsaaudio
In-Reply-To: <1417561004-27170-1-git-send-email-peter@korsgaard.com>
References: <1417561004-27170-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141205234559.663b39c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue,  2 Dec 2014 23:56:44 +0100, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                              |  1 +
>  package/python-alsaaudio/Config.in             | 12 ++++++++++++
>  package/python-alsaaudio/python-alsaaudio.hash |  2 ++
>  package/python-alsaaudio/python-alsaaudio.mk   | 15 +++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-alsaaudio/Config.in
>  create mode 100644 package/python-alsaaudio/python-alsaaudio.hash
>  create mode 100644 package/python-alsaaudio/python-alsaaudio.mk

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
