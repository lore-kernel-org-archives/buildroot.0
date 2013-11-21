From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 11:47:31 +0100
Subject: [Buildroot] [PATCH 1/1] Added stage2 ldscripts
In-Reply-To: <528DDAA9.20309@wanadoo.fr>
References: <1384986808-24363-1-git-send-email-thierry.bultel@wanadoo.fr>
 <20131121091316.16816a89@skate> <528DDAA9.20309@wanadoo.fr>
Message-ID: <20131121114731.3623f716@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 21 Nov 2013 11:04:25 +0100, Thierry Bultel wrote:

> I have taken your branch and compiled it. I am testing like this:
> 
> sudo kvm -cdrom rootfs.iso9660
> 
> which works with upstream + the lscript patch
> 
> However, on your branch, the grub menu does not show up, I am only 
> getting the grub minimal prompt. For the moment I cannot figure out why.
> 
> So that would mean that stage2 is OK but there is another extra issue.

I *believe* this usually means that it can't find the grub
configuration file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
