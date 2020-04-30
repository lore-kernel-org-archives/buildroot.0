From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:41:26 +0200
Subject: [Buildroot] [git commit] package/mariadb: patch mariadb_config
 to add sysroot path
In-Reply-To: <20200412200827.B951B8E840@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 12 Apr 2020 22:22:31 +0200")
References: <20200412200827.B951B8E840@busybox.osuosl.org>
Message-ID: <87h7x15eo9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=905e4f2890e92d7b417d9c219fa8d4394cd1c159
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This patch adds @CMAKE_SYSROOT@ to mariadb_config.c.in. Without it,
 > mariadb_config and mysql_config incorrectly returns host paths for
 > include paths and library paths.

 > The patch has been accepted upstream at
 > https://github.com/mariadb-corporation/mariadb-connector-c/commit/b787c0d69cc00af98cd4ee5bc205e1c7ddaf427a

 > Reported-by: Alexey Lukyanchuk <skif@skif-web.ru>
 > Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
