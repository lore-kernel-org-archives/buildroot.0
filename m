From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Oct 2014 11:49:42 +0200
Subject: [Buildroot] [V2 0/4] host-perl
In-Reply-To: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sat, 11 Oct 2014 08:36:41 +0200")
References: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <874mv3f2kp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > perl infrastructure using a host-perl instead of the system perl
 > V1 -> V2:
 >   - rebase the serie
 >   - XML-Parser doesn't use the infrastructure

 > Note: no test done for metacity

 > Francois Perrad (4):
 >   libxml-parser-perl: restore it like before perl infra
 >   perl: add host variant
 >   pkg-perl: refactor with host-perl
 >   perl: remove useless hacks

Committed series, thanks. I cannot say that I fully understand all the
perl stuff, but as you're the expert.. ;)

-- 
Bye, Peter Korsgaard
