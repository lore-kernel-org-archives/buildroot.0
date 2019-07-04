From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jul 2019 08:24:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: bump version to
 1.45.2
In-Reply-To: <20190702185948.21717-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 2 Jul 2019 20:59:48 +0200")
References: <20190702185948.21717-1-bernd.kuhls@t-online.de>
Message-ID: <87imsiz58z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.45.2

 > Disabled crond support for host build.

Does this mean that it now installs extra stuff for the target? Does it
make sense to add a sub option for it?

Committed, thanks.

-- 
Bye, Peter Korsgaard
