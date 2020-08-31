From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 18:24:00 +0200
Subject: [Buildroot] [PATCH] libcap: disable GOLANG
In-Reply-To: <d1e0d62f-098d-4dbb-037a-8f827772dd1e@aliyun.com> (Tian Yuanhao
 via buildroot's message of "Tue, 1 Sep 2020 00:14:30 +0800")
References: <1f3d9456-9ca2-75f4-7e15-d851e65005ea@aliyun.com>
 <873642deyy.fsf@dell.be.48ers.dk>
 <d1e0d62f-098d-4dbb-037a-8f827772dd1e@aliyun.com>
Message-ID: <87y2lubx7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tian" == Tian Yuanhao via buildroot <buildroot@busybox.net> writes:

 > This patch is for the next branch.

Ahh, then please mention that. An easy way to do that is using the
--subject-prefix argument to git send-email, E.G.:

git send-email --subject-prefix='PATCH-NEXT' ..

 > Recently, the go infrastructure has changed, and libcap has been
 > upgraded to 2.42. libcap introduced golang in 2.28, see:

 > https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/Make.Rules?id=0615d996379dceedefcd65a114f93fefd81c208f

 > When you compile host-go and then compile host-libcap, GOLANG will be
 > automatically set to yes. Because libcap.mk lacks golang support,
 > compilation will fail.

OK.

-- 
Bye, Peter Korsgaard
