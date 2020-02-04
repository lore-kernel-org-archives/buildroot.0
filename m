From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 15:02:48 +0100
Subject: [Buildroot] [PATCH v3 8/8] package/mariadb: security bump
 version to 10.4.12
In-Reply-To: <20200204012200.7273-8-bluemrp9@gmail.com> (Ryan Coe's message of
 "Mon, 3 Feb 2020 17:22:00 -0800")
References: <20200204012200.7273-1-bluemrp9@gmail.com>
 <20200204012200.7273-8-bluemrp9@gmail.com>
Message-ID: <87o8uejvqv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 > Release notes:
 > https://mariadb.com/kb/en/library/mariadb-10412-release-notes/

 > Changelog:
 > https://mariadb.com/kb/en/library/mariadb-10412-changelog/

 > Fixes the following security vulnerability:
 > CVE-2020-2574: Vulnerability in the MySQL Client product of Oracle MySQL
 > (component: C API). Supported versions that are affected are 5.6.46 and
 > prior, 5.7.28 and prior and 8.0.18 and prior. Difficult to exploit
 > vulnerability allows unauthenticated attacker with network access via
 > multiple protocols to compromise MySQL Client. Successful attacks of this
 > vulnerability can result in unauthorized ability to cause a hang or
 > frequently repeatable crash (complete DOS) of MySQL Client.

But this issue is also fixed in 10.3.22?

Can you please first send a security bump to 10.3.22, so this can be
backported to 2019.02.x / 2019.11.x.

If there is a desire to move to the 10.4 series, then this can be done
as a followup patch.

-- 
Bye, Peter Korsgaard
