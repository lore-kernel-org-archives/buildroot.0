From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 09:04:18 +0200
Subject: [Buildroot] [PATCH 1/1] host-mariadb: compile against bundled
	yassl
In-Reply-To: <20170728104440.12303-1-aduskett@gmail.com> (Adam Duskett's
 message of "Fri, 28 Jul 2017 06:44:40 -0400")
References: <20170728104440.12303-1-aduskett@gmail.com>
Message-ID: <87wp5fndvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > On Fedora26, openssl 1.1.x is included by default.  This causes build errors
 > when building the host variant of mariadb.

 > Addings -DWITH_SSL=bundled fixes this issue.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
