From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:20:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 10.3.23
In-Reply-To: <20200518140049.138333-1-bluemrp9@gmail.com>
References: <20200518140049.138333-1-bluemrp9@gmail.com>
Message-ID: <20200521152026.18387240@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 May 2020 07:00:49 -0700
Ryan Coe <bluemrp9@gmail.com> wrote:

> Add two spaces in hash file.
> 
> Remove patch 0002 as it has been applied upstream.
> 
> Release notes:
> https://mariadb.com/kb/en/library/mariadb-10323-release-notes/
> 
> Changelog:
> https://mariadb.com/kb/en/library/mariadb-10323-changelog/
> 
> Fixes the following security vulnerabilities:
> CVE-2020-2752 - Vulnerability in the MySQL Client product of Oracle MySQL
> (component: C API). Supported versions that are affected are 5.6.47 and
> prior, 5.7.27 and prior and 8.0.17 and prior. Difficult to exploit
> vulnerability allows low privileged attacker with network access via
> multiple protocols to compromise MySQL Client. Successful attacks of this
> vulnerability can result in unauthorized ability to cause a hang or
> frequently repeatable crash (complete DOS) of MySQL Client.
> 
> CVE-2020-2812 - Vulnerability in the MySQL Server product of Oracle MySQL
> (component: Server: Stored Procedure). Supported versions that are affected
> are 5.6.47 and prior, 5.7.29 and prior and 8.0.19 and prior. Easily
> exploitable vulnerability allows high privileged attacker with network
> access via multiple protocols to compromise MySQL Server. Successful attacks
> of this vulnerability can result in unauthorized ability to cause a hang or
> frequently repeatable crash (complete DOS) of MySQL Server.
> 
> CVE-2020-2814 - Vulnerability in the MySQL Server product of Oracle MySQL
> (component: InnoDB). Supported versions that are affected are 5.6.47 and
> prior, 5.7.28 and prior and 8.0.18 and prior. Easily exploitable
> vulnerability allows high privileged attacker with network access via
> multiple protocols to compromise MySQL Server. Successful attacks of this
> vulnerability can result in unauthorized ability to cause a hang or
> frequently repeatable crash (complete DOS) of MySQL Server.
> 
> CVE-2020-2760 - Vulnerability in the MySQL Server product of Oracle MySQL
> (component: InnoDB). Supported versions that are affected are 5.7.29 and
> prior and 8.0.19 and prior. Easily exploitable vulnerability allows high
> privileged attacker with network access via multiple protocols to compromise
> MySQL Server. Successful attacks of this vulnerability can result in
> unauthorized ability to cause a hang or frequently repeatable crash
> (complete DOS) of MySQL Server as well as unauthorized update, insert or
> delete access to some of MySQL Server accessible data.
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  ...2-add-sysroot-path-to-mariadb_config.patch | 29 -------------------
>  package/mariadb/mariadb.hash                  | 14 ++++-----
>  package/mariadb/mariadb.mk                    |  2 +-
>  3 files changed, 8 insertions(+), 37 deletions(-)
>  delete mode 100644 package/mariadb/0002-add-sysroot-path-to-mariadb_config.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
