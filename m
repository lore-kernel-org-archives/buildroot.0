From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:50:45 +0200
Subject: [Buildroot] [PATCH 2/7 v3] package/dropbear: Add separate
 configuration option for dropbear server
In-Reply-To: <53C827A5.6030609@zacarias.com.ar>
References: <1402982507.184682.35787456543.2.gpush@pablo>
 <53C827A5.6030609@zacarias.com.ar>
Message-ID: <20140723235045.083d25f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 17 Jul 2014 16:44:37 -0300, Gustavo Zacarias wrote:

> This can be disabled in a post build script by removing the initscript
> directly.
> If it were a build option that saves space in the target i'd say yay,
> but it's not.
> And it's a slippery rope since the same could be said/done to countless
> other packages that have client-server functionality like openssh,
> netsnmp, openvpn and so on.
> Others might disagree with me of course.

Agreed. Therefore, I've marked the patch as rejected in patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
