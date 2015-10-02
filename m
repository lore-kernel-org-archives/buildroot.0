From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2015 16:33:46 +0200
Subject: [Buildroot] [PATCH 2/2] cpio: install to /bin and after busybox
In-Reply-To: <1443793429-3117-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 2 Oct 2015 10:43:49 -0300")
References: <1443793429-3117-1-git-send-email-gustavo@zacarias.com.ar>
 <1443793429-3117-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d1wxiblh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > As the usual rule consider full-blown packages superior to busybox,
 > hence build after it.
 > Also install cpio to /bin to override the busybox-provided one.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
