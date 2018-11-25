From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:15:15 +0100
Subject: [Buildroot] [PATCH-2018.02.x 1/2] mariadb: drop my-small.cnf
 handling
In-Reply-To: <20181123204450.26813-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 23 Nov 2018 21:44:49 +0100")
References: <20181123204450.26813-1-peter@korsgaard.com>
Message-ID: <878t1g6hik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Unbreaks builds without BR2_PACKAGE_MARIADB_SERVER as this only gets
 > installed if the server is enabled.

 > As pointed out in commit 2b82e014b40 (package/mariadb: bump version to
 > 10.3.10), this file has been removed upstream in newer versions as it hasn't
 > been updated in >8 years and the compiled in defaults are sensible, so
 > completely remove the file handling instead of adding logic to only install
 > it if the server is enabled.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
