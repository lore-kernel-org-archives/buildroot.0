From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 8 Sep 2016 18:03:51 +0200
Subject: [Buildroot] [PATCH 1/1] php: add --enable-mysqlnd to configure
 options when using mysql extensions
In-Reply-To: <57D18809.8060701@gmail.com>
References: <20160907154857.3147-1-bluemrp9@gmail.com>
 <20160907235514.1779aeb6@free-electrons.com>
 <f86e9d4a-64ab-192b-6aaf-27b317eebdbc@je-eigen-domein.nl>
 <57D0A48C.8060106@gmail.com>
 <44537d0b-3c8b-edd0-1286-7f02e06694b9@je-eigen-domein.nl>
 <57D18809.8060701@gmail.com>
Message-ID: <319249ab-afc2-9bb0-0a82-a525b60e7108@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2016 05:47 PM, Ryan Coe wrote:
> Floris, Thomas, All,
>
> I did build the system without my patch and was able to make 
> everything work after defining the MySql socket location in my php.ini 
> file.  I guess my patch can be marked rejected.  I was thrown off 
> after looking at the build log.  The statement "checking whether to 
> enable mysqlnd... no" from the configure step led me to think that 
> that mysqlnd was not getting built.  If desired, I can submit a patch 
> to add --with-mysql-sock.

Have one here that expects the package providing MySQL to set a 
MYSQL_SOCKET variable, and the php package to use that:

http://lists.busybox.net/pipermail/buildroot/2016-September/171732.html
http://lists.busybox.net/pipermail/buildroot/2016-September/171733.html


Yours sincerely,

Floris Bos
