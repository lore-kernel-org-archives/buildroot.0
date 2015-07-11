From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 09:28:39 +0200
Subject: [Buildroot] [PATCH v8 11/16] rsyslog: fix config file comment
 style
In-Reply-To: <1436570882-56442-12-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436570882-56442-12-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150711092839.1a0afc2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Fri, 10 Jul 2015 18:27:57 -0500, Clayton Shotwell wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> The upstream versions of rsyslog (v8 and higher) have this commit to fix
> the config file comment issue. Carry this patch here until the version
> is bumped.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> ---
> Changes v7 -> v8:
>   - Reverted change to make file in favor of using upstream patch
>     (Suggested by Samuel)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
