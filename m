From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 21:52:42 +0200
Subject: [Buildroot] [PATCH 2/3] readline: install a .pc file
In-Reply-To: <20180422212005.13062-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 22 Apr 2018 23:20:04 +0200")
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
 <20180422212005.13062-3-thomas.petazzoni@bootlin.com>
Message-ID: <87efiopnn9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Some packages (such as udftools) fail to build against readline in
 > static linking configurations. To fix this, we install the .pc file
 > provided by readline.

 > Unfortunately, this .pc file is by default not correct, so a patch is
 > added to fix it, and this patch requires to re-autoconf the package
 > (but not autoreconf since only autoconf is used).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
