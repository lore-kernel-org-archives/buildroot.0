From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 20:51:22 +0200
Subject: [Buildroot] [PATCH] kexec: bump to 2.0.13
In-Reply-To: <20161019180044.GZ21808@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 19 Oct 2016 20:00:44 +0200")
References: <1476863154-16774-1-git-send-email-marcin.nowakowski@imgtec.com>
 <20161019180044.GZ21808@waldemar-brodkorb.de>
Message-ID: <87k2d4cgut.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Hi,
 > Marcin Nowakowski wrote,

 > Did you test for ARM?
 > I am sure it will not even build:
 > http://lists.infradead.org/pipermail/kexec/2016-September/017352.html

And we now also have an autobuilder failure:
http://autobuild.buildroot.net/results/019/01985a6b880a6eda26788ea83652fb2da4a7fa3c/build-end.log

Marcin, will you send a patch to fix it?

-- 
Bye, Peter Korsgaard
