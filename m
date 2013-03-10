From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 14:41:34 +0100
Subject: [Buildroot] [PATCH 1/6] fs/ext2: enclose the ext2 options in
 if...endif
In-Reply-To: <f2791dd673a1f0e27520d8ab102fe852ea75d9b9.1362693453.git.yann.morin.1998@free.fr>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <f2791dd673a1f0e27520d8ab102fe852ea75d9b9.1362693453.git.yann.morin.1998@free.fr>
Message-ID: <20130310144134.293f974d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  7 Mar 2013 23:04:38 +0100, Yann E. MORIN wrote:
> Use a 'if...endif' construct instead of repeating the
> 'depends on' for each symbols.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
