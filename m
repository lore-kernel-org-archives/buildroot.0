From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Nov 2020 18:19:02 +0100
Subject: [Buildroot] [PATCH] package/python-flask-cors: security bump to
 version 3.0.9
In-Reply-To: <20201118154742.6179-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 18 Nov 2020 16:47:42 +0100")
References: <20201118154742.6179-1-peter@korsgaard.com>
Message-ID: <874klkx7y1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2020-25032: An issue was discovered in Flask-CORS (aka CORS Middleware
 >   for Flask) before 3.0.9.  It allows ../ directory traversal to access
 >   private resources because resource matching does not ensure that pathnames
 >   are in a canonical format.

 > Also drop outdated md5 checksum and fix .hash indentation.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
