From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 23:43:12 +0100
Subject: [Buildroot] [PATCH v2] package/network-manager: Enable service
 under systemd
In-Reply-To: <1417510419-9400-1-git-send-email-nroach44@gmail.com>
References: <1417510419-9400-1-git-send-email-nroach44@gmail.com>
Message-ID: <20141207234312.67acc5df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Tue,  2 Dec 2014 16:53:39 +0800, Nathaniel Roach wrote:
> Previously NetworkManager had to be enabled and started on the
> first boot manually or by a script.
> 
> Add install define with the commands to setup the required
> service files for automatic start.
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
> Changes v1 -> v2
>   - Corrected the symlinks so they point to the correct files,
> 	ensuring the dispatcher service works

Thanks, applied. It would be good if some systemd person such as Eric
Le Bihan could have a look.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
