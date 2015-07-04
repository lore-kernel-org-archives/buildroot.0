From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 11:16:51 +0200
Subject: [Buildroot] [PATCH 0/7] Set of patches to add MariaDB galera
 cluster
In-Reply-To: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <20150704111651.3a50f30d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain Raybaud,

On Fri,  3 Jul 2015 15:11:19 +0200, Sylvain Raybaud wrote:

> Sylvain Raybaud (7):
>   Add package check: unit test library
>   Add rule to build host-libaio
>   Add package galera: wsrep provider for mysql and mariadb
>   Add PKG_CONFIG_* variables to help cmake find host-packages
>   Add fancy options to busybox sleep, like float arguments
>   Move mysql patches to version specific subdirectory
>   Propose mariadb galera cluster as an alternative to standard mysql
>     implementation, inside msyql package

For the commit title, we try to follow a convention of using:

	<package>: <what happens>

So your commit titles should rather be something like:

	check: new package
	libaio: add host variant
	galera: new package
	pkg-cmake: add PKG_CONFIG_* variables to help cmake find host packages
	busybox: adjust configuration to add fancy options to the sleep applet
	mysql: move patches into a version-specific subdirectory
	mysql: add mariadb variant

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
