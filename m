From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 23:00:54 +0200
Subject: [Buildroot] [PATCH v2] package/mariadb: security bump to
 version 10.3.15
In-Reply-To: <20190610233025.5275-1-bluemrp9@gmail.com>
References: <20190610233025.5275-1-bluemrp9@gmail.com>
Message-ID: <20190611230054.0f18be69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Jun 2019 16:30:25 -0700
Ryan Coe <bluemrp9@gmail.com> wrote:

> The licensing text in README.md has changed slightly. The reference to
> COPYING.LESSER has been removed. The file itself has been gone for awhile
> now. COPYING.thirdparty has also been renamed to THIRDPARTY.
> 
> Release notes:
> https://mariadb.com/kb/en/library/mariadb-10315-release-notes/
> 
> Changelog:
> https://mariadb.com/kb/en/mariadb-10315-changelog/
> 
> Fixes the following security vulnerabilities:
> 
> CVE-2019-2614 - Vulnerability in the MySQL Server component of Oracle MySQL
> (subcomponent: Server: Replication). Supported versions that are affected
> are 5.6.43 and prior, 5.7.25 and prior and 8.0.15 and prior. Difficult to
> exploit vulnerability allows high privileged attacker with network access
> via multiple protocols to compromise MySQL Server. Successful attacks of
> this vulnerability can result in unauthorized ability to cause a hang or
> frequently repeatable crash (complete DOS) of MySQL Server.
> 
> CVE-2019-2627 - Vulnerability in the MySQL Server component of Oracle MySQL
> (subcomponent: Server: Security: Privileges). Supported versions that are
> affected are 5.6.43 and prior, 5.7.25 and prior and 8.0.15 and prior.
> Easily exploitable vulnerability allows high privileged attacker with
> network access via multiple protocols to compromise MySQL Server.
> Successful attacks of this vulnerability can result in unauthorized ability
> to cause a hang or frequently repeatable crash (complete DOS) of MySQL
> Server.
> 
> CVE-2019-2628 - Vulnerability in the MySQL Server component of Oracle MySQL
> (subcomponent: InnoDB). Supported versions that are affected are 5.7.25 and
> prior and 8.0.15 and prior. Easily exploitable vulnerability allows high
> privileged attacker with network access via multiple protocols to
> compromise MySQL Server. Successful attacks of this vulnerability can
> result in unauthorized ability to cause a hang or frequently repeatable
> crash (complete DOS) of MySQL Server.
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fix hash of README.md (suggested by Arnout Vandecappelle)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
