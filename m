From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 09:02:55 +0100
Subject: [Buildroot] [PATCH 1/1] mariadb: bump version to 10.1.21
In-Reply-To: <87inp9sprj.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 20 Jan 2017 16:41:04 +0100")
References: <20170120151947.10915-1-bluemrp9@gmail.com>
 <87inp9sprj.fsf@dell.be.48ers.dk>
Message-ID: <87h94qkxu8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:
 >> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

 > Committed, thanks.

I now noticed that this update fixes a number of security issues:

https://mariadb.com/kb/en/mariadb/mariadb-10121-release-notes/

So it is a candidate for a backport to 2016.11.2. Please mention that in
the commit message in the future, thanks.

-- 
Bye, Peter Korsgaard
