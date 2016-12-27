From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Dec 2016 10:36:35 +0100
Subject: [Buildroot] [PATCH] busybox: fix modutils compile
In-Reply-To: <20161226192823.GA11664@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 26 Dec 2016 20:28:23 +0100")
References: <20161226192823.GA11664@waldemar-brodkorb.de>
Message-ID: <87mvfhd87w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Do not use syscall wrappers from uClibc.
 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed after adding a note that this has been submitted upstream, thanks.

-- 
Bye, Peter Korsgaard
