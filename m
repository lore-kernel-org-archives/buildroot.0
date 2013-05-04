From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 May 2013 23:08:45 +0200
Subject: [Buildroot] [PATCH v4 04/12] arc: Add support for ARC-specific
	binutils
In-Reply-To: <1367524293-32081-5-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Thu, 2 May 2013 21:51:25 +0200")
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
 <1367524293-32081-5-git-send-email-mjonker@synopsys.com>
Message-ID: <87k3neqwpu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> ARC support is not upstream yet...

 Mischa> package/binutils: add host-{flex,bison} dependencies for 2.19-arc

This line is a bit odd. Did you squash two commits and forgot to update
the commit message?

Committed with this removed, thanks.

-- 
Bye, Peter Korsgaard
