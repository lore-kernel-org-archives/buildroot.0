From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:31:04 +0200
Subject: [Buildroot] [PATCH v8 14/16] squashfs: Add xattr support
In-Reply-To: <1436570882-56442-15-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436570882-56442-15-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150711093104.71b9c4df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Fri, 10 Jul 2015 18:28:00 -0500, Clayton Shotwell wrote:
> Adding extended attribute support for the squashfs tools when the attr
> package is selected. This is needed for SELinux support.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> ---
> Changes v7 -> v8:
>   - Reverted changes to the host build options to leave xattr support
>     disabled due to too many host system dependencies issues.
>   - Cleaned up the target xattr options and added a dependency on attr
>     to ensure it is built before squashfs (Suggested by Thomas P.)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
