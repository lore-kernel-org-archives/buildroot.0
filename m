From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:43:45 +0100
Subject: [Buildroot] [PATCH 1/1] python-schedule: new package
In-Reply-To: <20171106182823.28656-1-joseph.kogut@gmail.com>
References: <20171106182823.28656-1-joseph.kogut@gmail.com>
Message-ID: <20171125134345.09f96466@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Nov 2017 10:28:23 -0800, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/python-schedule/Config.in            |  6 ++++++
>  package/python-schedule/python-schedule.hash |  5 +++++
>  package/python-schedule/python-schedule.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/python-schedule/Config.in
>  create mode 100644 package/python-schedule/python-schedule.hash
>  create mode 100644 package/python-schedule/python-schedule.mk

Applied to next, after fixing the alphabetic ordering in the DEVELOPERS
file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
