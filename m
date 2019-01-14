From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 21:54:11 +0100
Subject: [Buildroot] [PATCH v2,1/1] mutt: bump to version 1.11.2
In-Reply-To: <20190114202541.26823-1-fontaine.fabrice@gmail.com>
References: <20190114202541.26823-1-fontaine.fabrice@gmail.com>
Message-ID: <20190114215411.61a4e3ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Jan 2019 21:25:41 +0100, Fabrice Fontaine wrote:
> Remove patch (rejected upstream:
> https://gitlab.com/muttmua/mutt/merge_requests/25), an other solution
> has been preferred:
> https://gitlab.com/muttmua/mutt/commit/78db40f25c6479b14da5a73adf7207bfbec5ccc5)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Ryan Barnett):
>  - Remove host-pkgconf dependency

Applied to master after adjusting the commit log to explain why the
host-pkgconf dependency is dropped.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
