From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 17:06:27 +0100
Subject: [Buildroot] [PATCH v6 1/1] yad: new package
In-Reply-To: <1446219567-4540-1-git-send-email-james.knight@rockwellcollins.com>
References: <1446219567-4540-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151104170627.3ea7ee2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Fri, 30 Oct 2015 11:39:27 -0400, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
> Changes v5 -> v6:
>   - Cleanup yad help formatting to fit Buildroot style (with help from
>      Vicente Olivert Riera).

I've applied after doing a small change:

    [Thomas: remove dependency on libglib2, as it is not tested directly
    by yad's configure script, and is anyway guaranteed to be available
    since yad depends on gtk2 or gtk3, which both require libglib2.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
