From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:47:04 +0200
Subject: [Buildroot] [PATCH v2 5/5] targetcli-fb: new package
In-Reply-To: <1411034455-19670-6-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
 <1411034455-19670-6-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20140921194704.3d26e59f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Thu, 18 Sep 2014 12:00:55 +0200, Christophe Vu-Brugier wrote:
> targetcli-fb is a command-line interface for configuring the LIO
> generic SCSI target, present in 3.x Linux kernel versions.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
> Changes v1 -> v2:
>  - Merge "targetcli-fb: add sysv initscript" (as suggested by Thomas)
>  - Use TARGETCLI_FB_INSTALL_INIT_SYSV (as suggested by Thomas)
>  - Describe the purpose of creating "/etc/target/" (as suggested by Thomas)
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  package/Config.in                    |  1 +
>  package/targetcli-fb/Config.in       | 14 +++++++++++
>  package/targetcli-fb/S50target       | 46 ++++++++++++++++++++++++++++++++++++
>  package/targetcli-fb/targetcli-fb.mk | 26 ++++++++++++++++++++
>  4 files changed, 87 insertions(+)
>  create mode 100644 package/targetcli-fb/Config.in
>  create mode 100755 package/targetcli-fb/S50target
>  create mode 100644 package/targetcli-fb/targetcli-fb.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
