From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:25:49 +0100
Subject: [Buildroot] [PATCH] sshpass: bump version to 1.06
In-Reply-To: <20161102090136.6704-1-gary.bisson@boundarydevices.com>
References: <20161102090136.6704-1-gary.bisson@boundarydevices.com>
Message-ID: <20161102172549.7860c477@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Nov 2016 10:01:36 +0100, Gary Bisson wrote:
> Changelog:
> - Add -P for overriding the password prompt we search for
> - Add -v for verbose logging of the prompt detection prompt.
> - Allow packagers and compilers to change the default password prompt.
> - When giving -V, also print the default password prompt.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Reading the DEVELOPERS file I realized I had sshpass to look after. So here is
> an update.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
