From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Aug 2014 23:01:41 +0200
Subject: [Buildroot] [PATCH] perl: fix warnings at runtime
In-Reply-To: <1407694645-26356-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sun, 10 Aug 2014 20:17:25 +0200")
References: <1407694645-26356-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <877g2e7nbe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > autosplit.ix files are used by AutoLoader.pm
 >     Can't locate auto/Net/SSLeay/autosplit.ix in @INC (@INC contains: /usr/lib/perl5/site_perl/5.18.2/arm-linux /usr/lib/perl5/site_perl/5.18.2 /usr/lib/perl5/5.18.2/arm-linux /usr/lib/perl5/5.18.2 .) at /usr/lib/perl5/5.18.2/AutoLoader.pm line 181.
 >      at /usr/lib/perl5/site_perl/5.18.2/arm-linux/Net/SSLeay.pm line 24.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
