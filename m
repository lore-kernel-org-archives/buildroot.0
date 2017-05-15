From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 15:51:11 +0200
Subject: [Buildroot] [PATCH 1/1] mariadb: security bump to version
	10.1.23
In-Reply-To: <7f264a9b-c5cf-feaf-a8bf-929d112fb7f0@gmail.com> (Ryan Coe's
 message of "Fri, 12 May 2017 06:44:50 -0700")
References: <20170508153716.16809-1-bluemrp9@gmail.com>
 <87efvzno6c.fsf@dell.be.48ers.dk>
 <7f264a9b-c5cf-feaf-a8bf-929d112fb7f0@gmail.com>
Message-ID: <87bmqugre8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

Hi,

 >> Thanks, I (obviously) want to apply this, but something odd is going on
 >> with the licensing. COPYING.LESSER has been removed by this commit:
 >> 
 >> https://github.com/MariaDB/server/commit/577915def8
 >> 
 >> But the client library IS listed as being LGPL:
 >> 
 >> https://mariadb.com/kb/en/mariadb/mariadb-connector-c/
 >> 
 >> And same for the "old" one:
 >> 
 >> https://mariadb.com/kb/en/mariadb/lgpl-mysql-client-library-32358/
 >> 
 >> Grepping around in the 10.1.23 tarball, I don't see a lot of references
 >> to Lesser og LGPL.
 >> 
 >> Now, I know next to nothing about mariadb. Do you have any idea what is
 >> going on here?
 >> 
 > I am really not sure what is going on there.

:/

Could you perhaps try to contact the mariadb developers?

-- 
Bye, Peter Korsgaard
