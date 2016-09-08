From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 17:52:05 +0200
Subject: [Buildroot] [PATCH 1/1] php: add --enable-mysqlnd to configure
 options when using mysql extensions
In-Reply-To: <57D18809.8060701@gmail.com>
References: <20160907154857.3147-1-bluemrp9@gmail.com>
 <20160907235514.1779aeb6@free-electrons.com>
 <f86e9d4a-64ab-192b-6aaf-27b317eebdbc@je-eigen-domein.nl>
 <57D0A48C.8060106@gmail.com>
 <44537d0b-3c8b-edd0-1286-7f02e06694b9@je-eigen-domein.nl>
 <57D18809.8060701@gmail.com>
Message-ID: <20160908175205.4644bbc4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Sep 2016 08:47:21 -0700, Ryan Coe wrote:

> I did build the system without my patch and was able to make everything 
> work after defining the MySql socket location in my php.ini file.  I 
> guess my patch can be marked rejected.  I was thrown off after looking 
> at the build log.  The statement "checking whether to enable mysqlnd... 
> no" from the configure step led me to think that that mysqlnd was not 
> getting built.  If desired, I can submit a patch to add --with-mysql-sock.

Yes, please. It would be good to have something that works out of the
box.

> On a side note, I am not using MySql version supplied by Buildroot.  I 
> have replaced MySql with MariaDB 10.0.

Patches adding MariaDB would be good too :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
