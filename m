From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 May 2017 11:26:05 +0200
Subject: [Buildroot] [PATCH] nanomsg: new package
In-Reply-To: <1492766524-3682-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1492766524-3682-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170501112605.2c26ee02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 14:52:04 +0530, Rahul Bedarkar wrote:
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/nanomsg/Config.in    | 23 +++++++++++++++++++++++
>  package/nanomsg/nanomsg.hash |  2 ++
>  package/nanomsg/nanomsg.mk   | 24 ++++++++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 package/nanomsg/Config.in
>  create mode 100644 package/nanomsg/nanomsg.hash
>  create mode 100644 package/nanomsg/nanomsg.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
