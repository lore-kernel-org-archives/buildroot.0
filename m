From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:46:56 +0200
Subject: [Buildroot] [PATCH] python-django: security bump to version
 1.11.15
In-Reply-To: <20180817144736.18889-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 17 Aug 2018 16:47:36 +0200")
References: <20180817144736.18889-1-peter@korsgaard.com>
Message-ID: <874lfkjgn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bump to the latest release of the 1.11.x LTS series as 1.10.x is no longer
 > supported upstream:

 > https://www.djangoproject.com/download/

 > Fixes the following security issues:

 > - CVE-2017-12794: Possible XSS in traceback section of technical 500 debug
 >   page (1.11.5)

 > - CVE-2018-6188: Information leakage in AuthenticationForm (1.11.10)

 > - CVE-2018-7536: Denial-of-service possibility in urlize and urlizetrunc
 >   template filters (1.11.11)

 > - CVE-2018-7537: Denial-of-service possibility in truncatechars_html and
 >   truncatewords_html template filters (1.11.11)

 > - CVE-2018-14574: Open redirect possibility in CommonMiddleware (1.11.15)

 > Also add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
