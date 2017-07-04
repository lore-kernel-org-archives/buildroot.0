From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:48:34 +0200
Subject: [Buildroot] [PATCH v3 03/11] fs/ext2: always pass the label
 option
In-Reply-To: <20170703225106.1492-4-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-4-s.martin49@gmail.com>
Message-ID: <20170704084834.413f054d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 00:50:58 +0200, Samuel Martin wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ... since passing an empty string is equivalent to not setting a label.
> 
> And fix the syntax highlighting in some editors...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v2->v3:
> - none

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
