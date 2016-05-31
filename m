From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:41:24 +0200
Subject: [Buildroot] [PATCH v3 next 1/5] php: bump version to 7.0.6
In-Reply-To: <1464015096-48578-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464015096-48578-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160531214124.4b760e0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 15:51:32 +0100, Vicente Olivert Riera wrote:
> Remove MySQL legacy extension.
> 
> Remove incompatible external modules:
>  - php-gnupg
>  - php-memcached
>  - php-ssh2
>  - php-yaml
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3:
>  - Bump version from 7.0.5 to 7.0.6.
>  - Remove MySQL legacy extension. (Thanks Thomas Petazzoni)
> Changes v1 -> v2:
>  - Split it in different patches.

Entire series applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
