From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:14:09 +0200
Subject: [Buildroot] [PATCH v3] package/zeromq: enable kernel-based
 feature flags
In-Reply-To: <1429689536-15301-1-git-send-email-lionel.orry@gmail.com>
References: <1429689536-15301-1-git-send-email-lionel.orry@gmail.com>
Message-ID: <20150422221409.0e4b86b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Wed, 22 Apr 2015 09:58:56 +0200, Lionel Orry wrote:
> The current configuration system does not check for cached variables for
> these flags, and thus they are always disabled when cross-compiling.
> This patch fixes the configuration system to use cached variables and
> enables them at configuration time.
> 
> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
> 
> ---
> Changes v2 -> v3:
>   - use unmodified upstream patch integrated in future v4.2.x releases
>     (suggested by Arnout)
> Changes v1 -> v2:
>   - fix indentation of continuation lines (suggested by Thomas P.)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
