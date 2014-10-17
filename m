From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Oct 2014 16:27:53 +0200
Subject: [Buildroot] [V2 0/4] host-perl
In-Reply-To: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sat, 11 Oct 2014 08:36:41 +0200")
References: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87siimdb4m.fsf@dell.be.48ers.dk>
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

It seems to cause a number of autobuild failures, could you take a look please?

http://autobuild.buildroot.net/results/688/6881a8f6366085f89bea0d8b3a77fa23af26f3b7/build-end.log
http://autobuild.buildroot.net/results/d68/d68143ec7745854c97df6c5221b03ff586dec1b1/build-end.log
http://autobuild.buildroot.net/results/aaf/aaf91380953ebb84c582b38b46cfb180ff6862cb/build-end.log

-- 
Bye, Peter Korsgaard
