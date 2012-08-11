From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:16:51 +0200
Subject: [Buildroot] [PATCH] Add package linux-pam
In-Reply-To: <1344653426-3036-1-git-send-email-golubovsky@gmail.com>
References: <1344653426-3036-1-git-send-email-golubovsky@gmail.com>
Message-ID: <20120811221651.621f2d34@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 10 Aug 2012 22:50:26 -0400,
Dmitry <golubovsky@gmail.com> a ?crit :

> Signed-off-by: Dmitry <golubovsky@gmail.com>
> ---
>  package/Config.in                                 |    1 +
>  package/linux-pam/Config.in                       |   15 +++++++++
>  package/linux-pam/linux-pam-configure.patch       |   20 ++++++++++++
>  package/linux-pam/linux-pam-doc-makefile-am.patch |   33 +++++++++++++++++++++
>  package/linux-pam/linux-pam-group.patch           |   26 ++++++++++++++++
>  package/linux-pam/linux-pam-rhosts.patch          |   24 +++++++++++++++
>  package/linux-pam/linux-pam-succeed.patch         |   31 +++++++++++++++++++
>  package/linux-pam/linux-pam-time.patch            |   26 ++++++++++++++++
>  package/linux-pam/linux-pam.mk                    |   27 +++++++++++++++++
>  9 files changed, 203 insertions(+), 0 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
