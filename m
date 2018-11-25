From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:15:26 +0100
Subject: [Buildroot] [PATCH-2018.02.x 2/2] mariadb: security bump to
 version 10.1.37
In-Reply-To: <20181123204450.26813-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 23 Nov 2018 21:44:50 +0100")
References: <20181123204450.26813-1-peter@korsgaard.com>
 <20181123204450.26813-2-peter@korsgaard.com>
Message-ID: <874lc46hi9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > CVE-2018-3282: Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Server: Storage Engines).  Supported versions that are
 > affected are 5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12
 > and prior.  Easily exploitable vulnerability allows high privileged attacker
 > with network access via multiple protocols to compromise MySQL Server.
 > Successful attacks of this vulnerability can result in unauthorized ability
 > to cause a hang or frequently repeatable crash (complete DOS) of MySQL
 > Server.

 > CVE-2016-9843: The crc32_big function in crc32.c in zlib 1.2.8 might allow
 > context-dependent attackers to have unspecified impact via vectors involving
 > big-endian CRC calculation.

 > CVE-2018-3174: Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: Client programs).  Supported versions that are affected are
 > 5.5.61 and prior, 5.6.41 and prior, 5.7.23 and prior and 8.0.12 and prior.
 > Difficult to exploit vulnerability allows high privileged attacker with
 > logon to the infrastructure where MySQL Server executes to compromise MySQL
 > Server.  While the vulnerability is in MySQL Server, attacks may
 > significantly impact additional products.  Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-3143: Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.6.41 and
 > prior, 5.7.23 and prior and 8.0.12 and prior.  Easily exploitable
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server.  Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-3156: Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.6.41 and
 > prior, 5.7.23 and prior and 8.0.12 and prior.  Easily exploitable
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server.  Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > CVE-2018-3251: Vulnerability in the MySQL Server component of Oracle MySQL
 > (subcomponent: InnoDB).  Supported versions that are affected are 5.6.41 and
 > prior, 5.7.23 and prior and 8.0.12 and prior.  Easily exploitable
 > vulnerability allows low privileged attacker with network access via
 > multiple protocols to compromise MySQL Server.  Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Server.

 > The README has gotten a few extra URLs added, so update the sha256 to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
