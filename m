From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 14:59:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version
 2015.04
In-Reply-To: <1429339603-12415-1-git-send-email-joerg.krause@embedded.rocks>
References: <1429339603-12415-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150418145954.1f87d02f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 18 Apr 2015 08:46:43 +0200, J?rg Krause wrote:
> Bump to version 2015.04:
>   * Enable optional support for FIT Signature Verification
>   * Remove patch 0002-nostrip, it's upstream
>   * Add musl patch
>   * Add hash file
> 
> This patch supersedes "package/uboot-tools: bump to version 2015.01"
> http://patchwork.ozlabs.org/patch/440396/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks, after doing some small changes:

    [Thomas:
      - Rewrap Config.in help text.
      - Move the paragraph about potential license compatibility issue
        from Config.in.host to Config.in, since it's really on the target
        package that such issues can be a problem.
      - Use += instead of = when adding the dependency on openssl, so that
        if other dependencies get added later, we don't overwrite them
        mistakenly.]

Could you try to upstream the different patches we have on uboot-tools?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
