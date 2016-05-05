From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 23:37:33 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <572BBB30.9090901@gmail.com>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be>
 <572AEB2E.1050305@gmail.com> <572AFC1F.3070004@gmail.com>
 <20160505142533.67f8e473@free-electrons.com>
 <572BBB30.9090901@gmail.com>
Message-ID: <20160505233733.3df9843b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 May 2016 23:29:20 +0200, Marco Trapanese wrote:

> but I got:
> 
> error: patch non riuscita: package/qt5/qt5connectivity/Config.in:4
> error: package/qt5/qt5connectivity/Config.in: la patch non pu? essere 
> applicata
> error: patch non riuscita: package/qt5/qt5connectivity/qt5connectivity.mk:20
> error: package/qt5/qt5connectivity/qt5connectivity.mk: la patch non pu? 
> essere applicata

Please use LANG=C before posting messages to mailing lists. Not
everybody speaks italian :)

> Thus I opened the file package/qt5/qt5connectivity/Config.in and in fact 
> I see a content very different from the "old version" reported in the patch.

The patch I pointed to depends on patch
https://patchwork.ozlabs.org/patch/612072/. You need to apply both.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
