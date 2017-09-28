From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 23:27:23 +0200
Subject: [Buildroot] [PATCH 1/1] ejabberd: Replace $(HOST_DIR) to /usr
	in ERL path
In-Reply-To: <20170925163431.24409-1-johan.oudinet@gmail.com> (Johan Oudinet's
 message of "Mon, 25 Sep 2017 18:34:31 +0200")
References: <20170925163431.24409-1-johan.oudinet@gmail.com>
Message-ID: <874lrmikec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johan" == Johan Oudinet <johan.oudinet@gmail.com> writes:

 > Previously, it was working by luck. Buildroot has fixed its definition
 > of HOST_DIR and pkg-autotools.mk uses the classical /usr prefix. So,
 > fix this sed expression to correctly replace $(HOST_DIR) by /usr in ERL
 > path.

 > Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
