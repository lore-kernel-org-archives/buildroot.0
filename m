From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 9 Mar 2011 18:09:51 +0000 (UTC)
Subject: [Buildroot] Is PHP download link in php.mk broken?
Message-ID: <il8fpe$k15$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I enabled the php package today, and it appears that the download link
used by buildroot is invalid.  It's using

/home/nextgen/buildroot/downloads/php-$(PHP_VERSION).tar.bz2

That link doesn't work for any of the version numbers I treid.  What
you get is a blob of HTML that says this:

 Sorry, but the function distributions/php-5.2.12.tar.bz2 is not in
 the online manual. Perhaps you misspelled it, or it is a relatively
 new function that hasn't made it into the online documentation yet.
 The following are the 20 functions which seem to be closest in
 spelling to distributions/php-5.2.12.tar.bz2 (really good matches are
 in bold). Perhaps you were looking for one of these: [...]

Does php.mk download the right thing for anybody else?
 
-- 
Grant Edwards               grant.b.edwards        Yow! My EARS are GONE!!
                                  at               
                              gmail.com            
