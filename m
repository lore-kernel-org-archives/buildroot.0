From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 20:18:38 +0200
Subject: [Buildroot] [PATCH] ti-sgx-um: fix missing line continuation
In-Reply-To: <1468690274-22919-1-git-send-email-gustavo@zacarias.com.ar>
References: <1468690274-22919-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160716201838.6f6dfcc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 14:31:14 -0300, Gustavo Zacarias wrote:
> It's missing for the threads conditional, which otherwise results in:
> package/ti-sgx-um/Config.in:6: syntax error
> package/ti-sgx-um/Config.in:5: invalid option
> package/ti-sgx-um/Config.in:6: unknown option
> "BR2_TOOLCHAIN_HAS_THREADS"
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Yann sent a similar patch 2h earlier, so I merged Yann's patch. Thanks
for fixing my crap :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
