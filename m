From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 17:48:35 +0100
Subject: [Buildroot] [PATCH 1/3] qextserialport: install QExtSerialPort
 header with qmake
In-Reply-To: <20161124223747.31342-1-arnout@mind.be>
References: <20161124223747.31342-1-arnout@mind.be>
Message-ID: <20161125174835.7b233507@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 23:37:45 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Instead of manually copying the QExtSerialPort header introduced in
> patch 0002, update the patch to include this header in the qmake
> project file so it gets properly installed.
> 
> While we're at it, convert to a git-formatted patch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/818b564a6e23bcecf4afc7e53811227b08e5f4eb
> http://autobuild.buildroot.net/results/0b6c2d7c63329f5e790f02ccd29f14a317eadc71
> http://autobuild.buildroot.net/results/ac552b63c6fb099a136066cda421f68e639808fa
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Note: probably won't apply cleanly because of the silly line endings in
> qextserialport.pri.
> ---
>  ...Create-a-main-include-file-QExtSerialPort.patch | 43 ++++++++++++++++++++++
>  package/qextserialport/0002-main-include.patch     | 15 --------
>  package/qextserialport/qextserialport.mk           |  1 -
>  3 files changed, 43 insertions(+), 16 deletions(-)
>  create mode 100644 package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
>  delete mode 100644 package/qextserialport/0002-main-include.patch

Patches 1 and 2 applied to master. I'm keeping Patch 3 on the side to
apply once next has been merged back into master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
