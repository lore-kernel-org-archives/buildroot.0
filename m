From: Fathi Boudra <fboudra@gmail.com>
Date: Thu, 19 Jun 2008 20:18:24 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19091D654B@mi8nycmail19.Mi8.com>
References: <20080619081151.B9E73F8008@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE19091D654B@mi8nycmail19.Mi8.com>
Message-ID: <200806192018.25286.fboudra@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> bigguiness at etch:~/src/build/buildroot$ make menuconfig
> make CC="/usr/bin/gcc" -C package/config conf mconf
> /bin/sh: ././check.sh: No such file or directory

missing check.sh. You can take it from bernhard git repos.
Then you need to use "depends on" instead on "depends".

I guess it will be fixed soon on svn repo.

cheers,

Fathi
