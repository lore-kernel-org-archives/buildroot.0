From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 08:39:38 +0100
Subject: [Buildroot] [PATCH] python-tornado: add zlib run-time dependency
In-Reply-To: <1416255335-4335-1-git-send-email-yegorslists@googlemail.com>
 (Yegor Yefremov's message of "Mon, 17 Nov 2014 21:15:35 +0100")
References: <1416255335-4335-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87r3x1aret.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 >  package/python-tornado/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
 > index c127d0e..870a3de 100644
 > --- a/package/python-tornado/Config.in
 > +++ b/package/python-tornado/Config.in
 > @@ -1,6 +1,7 @@
 >  config BR2_PACKAGE_PYTHON_TORNADO
 >  	bool "python-tornado"
 >  	depends on BR2_PACKAGE_PYTHON
 > +	select BR2_PACKAGE_PYTHON_ZLIB

Committed, thanks.

-- 
Bye, Peter Korsgaard
