From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 15:13:17 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix build
In-Reply-To: <20170714101418.4529-1-s.martin49@gmail.com> (Samuel Martin's
 message of "Fri, 14 Jul 2017 12:14:18 +0200")
References: <20170714101418.4529-1-s.martin49@gmail.com>
Message-ID: <87k23bb1qq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Add a patch to nginx configuration system fixing misdetected unneeded PCRE
 > dependency.

 > This patch has been submitted upstream [1].

 > Fixes:
 >   http://autobuild.buildroot.net/results/bc7/bc7458b97a88785653845afd30fe9d5f3a69905b/build-end.log

 > [1] http://mailman.nginx.org/pipermail/nginx-devel/2017-July/010308.html

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
