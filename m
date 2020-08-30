From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Aug 2020 18:11:10 +0200
Subject: [Buildroot] [PATCH RFC 1/3] package/pkg-generic.mk: support
 hooks and tables in virtual packages
In-Reply-To: <20191030132759.8643-2-unixmania@gmail.com>
References: <20191030132759.8643-1-unixmania@gmail.com>
 <20191030132759.8643-2-unixmania@gmail.com>
Message-ID: <99d9fedd-902e-8851-c538-d25431976571@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/10/2019 14:27, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Virtual packages are not built but it's useful to allow them to have
> permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.
> 
> With this change we don't need to replicate date as currently done in
> eudev and systemd user tables or test if the package is selected to add
> a target-finalize hook as in luainterpreter.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

 Since Yann's suggestion didn't work, I've applied the original (with typo fixes
in commit message) to next, thanks.

 Regards,
 Arnout
