From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jul 2014 00:10:04 +0200
Subject: [Buildroot] [PATCH 2/4] mysql: add mysql user
In-Reply-To: <1393944603-3104-2-git-send-email-kuyurix@gmail.com>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
 <1393944603-3104-2-git-send-email-kuyurix@gmail.com>
Message-ID: <20140722001004.52e9c342@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcelo Guti?rrez,

On Tue,  4 Mar 2014 14:50:01 +0000, Marcelo Guti?rrez wrote:

> +define MYSQL_USERS
> +	mysql -1 nogroup -1 = /var/mysql /bin/sh -
> +endef

I've changed = to * to generate an user that cannot log in. I've
changed /bin/sh to - because there's no point in having a shell
defined. And I've added a description of the user.

Applied with those changes, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
