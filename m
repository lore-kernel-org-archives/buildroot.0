From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 17:51:57 +0200
Subject: [Buildroot] [PATCH] package/nginx: security bump to version
 1.16.1
In-Reply-To: <20190823102133.12952-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 23 Aug 2019 12:21:32 +0200")
References: <20190823102133.12952-1-peter@korsgaard.com>
Message-ID: <878sr61ysi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >        Security: when using HTTP/2 a client might cause excessive memory
 >        consumption and CPU usage (CVE-2019-9511, CVE-2019-9513,
 >        CVE-2019-9516).

 > For details, see the advisory:
 > https://mailman.nginx.org/pipermail/nginx-announce/2019/000249.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
