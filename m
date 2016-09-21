From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 22:20:37 +0200
Subject: [Buildroot] [PATCH] circus,
	python-psutil: fix syntax in Config.in
In-Reply-To: <1474474708-4848-1-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Wed, 21 Sep 2016 21:48:28 +0530")
References: <1474474708-4848-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <87vaxpromi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > After commit ab930190d775 ("python-psutil: not available on musl")
 > we are getting following error when we set defconfig

 > package/python-psutil/Config.in:14: syntax error
 > package/python-psutil/Config.in:13: invalid option
 > package/circus/Config.in:21: syntax error
 > package/circus/Config.in:20: invalid option

 > Fixes: ab930190d775 ("python-psutil: not available on musl")

Gaah, sorry!

-- 
Bye, Peter Korsgaard
