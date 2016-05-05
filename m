From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 15:41:18 +0200
Subject: [Buildroot] [PATCH 2/2] configs/qemu: bump to the latest version
In-Reply-To: <572B459D.8060304@zacarias.com.ar>
References: <1462447857-29400-1-git-send-email-gustavo@zacarias.com.ar>
 <1462447857-29400-2-git-send-email-gustavo@zacarias.com.ar>
 <20160505130537.GX26720@waldemar-brodkorb.de>
 <572B459D.8060304@zacarias.com.ar>
Message-ID: <20160505154118.323b19a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 May 2016 10:07:41 -0300, Gustavo Zacarias wrote:

> uname -a will quick you out (logout).
> ps will do as well.
> Seems that anything that's run will throw the parent shell down.

I've seen the same behavior. Any application you start will make the
parent shell exit/crash when the application exists.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
