From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Feb 2020 17:29:09 +0100
Subject: [Buildroot] [PATCH] package/exim: fix systemd service binary
 path
In-Reply-To: <20200228082539.4530-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Fri, 28 Feb 2020 09:25:39 +0100")
References: <20200228082539.4530-1-p.debruijn@unilogic.nl>
Message-ID: <87h7z9ich6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > modern versions of exim are installed into sbin not bin
 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
