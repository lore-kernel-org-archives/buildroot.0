From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:15:50 +0200
Subject: [Buildroot] [PATCH v5 01/24] sepolgen: new package
In-Reply-To: <1431553177-7280-2-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-2-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150521231550.57ff5f8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 13 May 2015 16:39:14 -0500, Clayton Shotwell wrote:
> From: Clayton Shotwell <clshotwe@rockwellcollins.com>
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes v4 -> v5:
>   - Fixed package name to be BR2_PACKAGE_HOST_SEPOLGEN (Suggested by
>     Thomas P.)
>   - No menu entry needed as host dependency aren't reflected in
>     Config.in files (Suggested by Thomas P.)

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
