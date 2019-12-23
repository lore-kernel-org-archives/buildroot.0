From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:12:35 +0100
Subject: [Buildroot] [PATCH] package/easy-rsa: select the appropriate
 option for openssl binary
In-Reply-To: <20191213152546.1376732-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 13 Dec 2019 16:25:45 +0100")
References: <20191213152546.1376732-1-thomas.petazzoni@bootlin.com>
Message-ID: <87k16nwjd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since openssl was converted to a virtual package,
 > BR2_PACKAGE_OPENSSL_BIN no longer exists: it was renamed to
 > BR2_PACKAGE_LIBOPENSSL_BIN, but easy-rsa was not changed accordingly.

 > easy-rsa needs to take into account the two providers of openssl, and
 > select the appropriate suboptions depending on which openssl
 > implementation was chosen.

 > Ideally, we would probably need a more elaborate option that ensures
 > easy-rsa doesn't have to know the details of which openssl
 > implementation is selected, but practically speaking with just two
 > providers of openssl at the moment, the proposed solution is good
 > enough.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
