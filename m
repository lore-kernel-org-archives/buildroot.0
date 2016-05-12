From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 12 May 2016 15:08:51 +0000 (UTC)
Subject: [Buildroot] Is uClibc dead?
Message-ID: <nh26a3$g4l$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I recently decided to check to see what changes had been made to
uClibc since the 4 year old version we're using in our product.  So I
went to https://uclibc.org.

After jumping through hoops because all the SSL certificates are
invalid/expired I see under latest news:

  15 May 2012, uClibc 0.9.33.2 Released

  uClibc-0.9.33.2 was released today. 

Odd... no releases for four years?

Is uClibc abandoned?

I see that buildroot now uses uclibc-ng which, according Wikipedia, is

  "a spin-off of uClibc that regularly provides a stable and tested
   release, which is more suitable for different software development
   processes."

So... processes different than what?

-- 
Grant Edwards               grant.b.edwards        Yow! Not SENSUOUS ... only
                                  at               "FROLICSOME" ... and in
                              gmail.com            need of DENTAL WORK ... in
                                                   PAIN!!!
