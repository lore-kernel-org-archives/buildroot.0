From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:23:27 +0200
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump version to
 10.1.26
In-Reply-To: <20170822140726.2232-1-bluemrp9@gmail.com>
References: <20170822140726.2232-1-bluemrp9@gmail.com>
Message-ID: <20170823152327.5fa3218c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Aug 2017 07:07:26 -0700, Ryan Coe wrote:
> Release notes: https://mariadb.com/kb/en/mariadb-10126-release-notes/
> Changelog: https://mariadb.com/kb/en/mariadb-10126-changelog/
> 
> Fixes the following security vulnerabilities:
> 
> CVE-2017-3636 - Vulnerability in the MySQL Server component of Oracle MySQL
> (subcomponent: Client programs). Supported versions that are affected are
> 5.5.56 and earlier and 5.6.36 and earlier. Easily exploitable vulnerability
> allows low privileged attacker with logon to the infrastructure where MySQL
> Server executes to compromise MySQL Server. Successful attacks of this
> vulnerability can result in unauthorized update, insert or delete access to
> some of MySQL Server accessible data as well as unauthorized read access to
> a subset of MySQL Server accessible data and unauthorized ability to cause
> a partial denial of service (partial DOS) of MySQL Server.
> 
> CVE-2017-3641 - Vulnerability in the MySQL Server component of Oracle MySQL
> (subcomponent: Server: DML). Supported versions that are affected are
> 5.5.56 and earlier, 5.6.36 and earlier and 5.7.18 and earlier. Easily
> exploitable vulnerability allows high privileged attacker with network
> access via multiple protocols to compromise MySQL Server. Successful
> attacks of this vulnerability can result in unauthorized ability to cause
> a hang or frequently repeatable crash (complete DOS) of MySQL Server.
> 
> CVE-2017-3653 - Vulnerability in the MySQL Server component of Oracle MySQL
> (subcomponent: Server: DDL). Supported versions that are affected are
> 5.5.56 and earlier, 5.6.36 and earlier and 5.7.18 and earlier. Difficult
> to exploit vulnerability allows low privileged attacker with network access
> via multiple protocols to compromise MySQL Server. Successful attacks of
> this vulnerability can result in unauthorized update, insert or delete
> access to some of MySQL Server accessible data.
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/mariadb/mariadb.hash | 4 ++--
>  package/mariadb/mariadb.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
