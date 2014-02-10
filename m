From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Feb 2014 20:40:50 +0100
Subject: [Buildroot] [pkg-perl infra V6 6/9] perl: remove useless patch
In-Reply-To: <1392034997-12394-7-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Mon, 10 Feb 2014 13:23:13 +0100")
References: <1392034997-12394-1-git-send-email-francois.perrad@gadz.org>
 <1392034997-12394-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <87mwhyycvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > The Perl infrastructure uses a host version of Module-Build
 > (see previous commit "host-perl-module-build: new package").
 > The target version is never used, so no need to patch it.

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
