From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 23:11:56 +0200
Subject: [Buildroot] [PATCH] let-me-create: new package
In-Reply-To: <1493834484-30672-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1493834484-30672-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170729231156.38e5dc5e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 May 2017 23:31:24 +0530, Rahul Bedarkar wrote:
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/let-me-create/Config.in          | 27 +++++++++++++++++++++++++++
>  package/let-me-create/let-me-create.hash |  2 ++
>  package/let-me-create/let-me-create.mk   | 20 ++++++++++++++++++++
>  5 files changed, 51 insertions(+)
>  create mode 100644 package/let-me-create/Config.in
>  create mode 100644 package/let-me-create/let-me-create.hash
>  create mode 100644 package/let-me-create/let-me-create.mk

Applied to master with the following changes:

    [Thomas: minor tweaks in Config.in file, adjust .mk file for
    static+shared build.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
