From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 22:41:56 +0200
Subject: [Buildroot] [PATCH 06/83 v2] package/jquery: include external
 plugins from jquery's Config.in
In-Reply-To: <13ca9d4ffea2b013e14e95f6475aa49670f82171.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <13ca9d4ffea2b013e14e95f6475aa49670f82171.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704224156.351a37c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:17 +0200, Yann E. MORIN wrote:
> ... and make it a menuconfig instead of a 'config'+'menu'.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I very much prefer to have all packages included from the top-level
package/Config.in, as much as possible. So I don't really like this
change and prefer to keep things as they are today.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
