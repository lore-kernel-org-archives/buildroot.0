From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 22:09:24 +0100
Subject: [Buildroot] [PATCH] uclibc: get rid of ARC's uClibc fork
In-Reply-To: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Tue, 27 Oct 2015 18:16:45 +0300")
References: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87vb9s81dn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > For quite some time all ARC changes have been pushed upstream.
 > So both uClibc master branch and uClibc-ng have full ARC support
 > including the most recent changes.

 > I.e. finally we have reached the point when there's no need in
 > Synopsys fork of uClibc on GitHub and it will soon be obsoleted and
 > removed at some pint of time.

 > Now since vanilla uClibc hasn't seen any releases for many years we cannot
 > really use it for ARC. Fortunately there exists uClibc-ng and Waldemar
 > cuts releases regularly - that works perfectly fine for us.

 > That patch removes all mentions of ARC's uClibc which in turn makes
 > uClibc-ng default libc for ARC.

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
