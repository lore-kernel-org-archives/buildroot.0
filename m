From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 17:02:02 +0100
Subject: [Buildroot] Make error with Builroot
In-Reply-To: <CACG_XU1kK1G6KeANOF1d-3eXwe=TyLL_3F9YcE=T0P2aJ_AgSw@mail.gmail.com>
References: <1450364297578-120495.post@n4.nabble.com>
 <20151217162514.751e3cc3@free-electrons.com>
 <CACG_XU1kK1G6KeANOF1d-3eXwe=TyLL_3F9YcE=T0P2aJ_AgSw@mail.gmail.com>
Message-ID: <20151217170202.3985ce98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Dec 2015 07:19:46 -0800 (PST), yann12 wrote:

> Thanks for your help, here is the pastebin of the /home/novtech/Projects/me_
> buildroot-2014.08/output/build/ncurses-5.9/config.log :
> 
> http://code.bulix.org/li2yfp-90040

Thanks. It shows that the cross-compiler is not available, which is
clearly not possible, since all target packages depend on the toolchain.

Is this what happens after a complete "make clean all" cycle ?

Please pastebin the entire output of "make clean all" so we can see
what's going on. Alternatively, you may want to join our #buildroot IRC
channel on Freenode to get some live support, which might be easier
than over e-mail.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
