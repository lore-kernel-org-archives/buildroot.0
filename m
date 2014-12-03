From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Dec 2014 13:33:09 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/nginx: remove rtsig module
	support
In-Reply-To: <1417471496-7391-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Mon, 1 Dec 2014 23:04:56 +0100")
References: <1417471496-7391-1-git-send-email-s.martin49@gmail.com>
 <1417471496-7391-2-git-send-email-s.martin49@gmail.com>
Message-ID: <878uiozzei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > rtsig module uses the deprecated sysctl syscall, which is not
 > implemented on some recent architecture (such as arc).

 > Also, rtsig module is almost consider as deprecated by some nginx

s/consider/considered/

Committed, thanks.

-- 
Bye, Peter Korsgaard
