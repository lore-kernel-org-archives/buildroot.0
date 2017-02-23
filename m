From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Feb 2017 21:34:13 +0100
Subject: [Buildroot] [git commit] util-linux: security bump to version
	2.29.2
In-Reply-To: <595202195.11970979.1487864574446.JavaMail.zimbra@datacom.ind.br>
 (Carlos Santos's message of "Thu, 23 Feb 2017 12:42:54 -0300 (BRT)")
References: <20170223085742.C646982235@busybox.osuosl.org>
 <595202195.11970979.1487864574446.JavaMail.zimbra@datacom.ind.br>
Message-ID: <87bmtsmyt6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

Hi,

 >> From
 >> https://www.kernel.org/pub/linux/utils/util-linux/v2.29/v2.29.2-ReleaseNotes
 >> 
 >> This release fixes su(1) security issue CVE-2017-2616:
 >> 
 >> It is possible for any local user to send SIGKILL to other processes with root
 >> privileges.  To exploit this, the user must be able to perform su with a
 >> successful login.  SIGKILL can only be sent to processes which were executed
 >> after the su process.  It is not possible to send SIGKILL to processes which
 >> were already running.

 > Should not this go to next too, since it is a security fix?

Well, next will be merged into master in a few days - So I don't think
that is really critical. I will add it to the 2016.11.x branch though.

-- 
Bye, Peter Korsgaard
