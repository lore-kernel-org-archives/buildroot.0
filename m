From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Apr 2012 23:27:52 +0200
Subject: [Buildroot] [PATCH v4] New Package: latencytop
In-Reply-To: <1334747160-7990-1-git-send-email-qais.yousef@imgtec.com> (Qais
 Yousef's message of "Wed, 18 Apr 2012 12:06:00 +0100")
References: <1334747160-7990-1-git-send-email-qais.yousef@imgtec.com>
Message-ID: <87d36wg6qv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Qais" == Qais Yousef <qais.yousef@imgtec.com> writes:

 Qais> Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>

Committed, thanks.

 Qais> @@ -37,6 +37,7 @@ source "package/strace/Config.in"
 Qais>  source "package/whetstone/Config.in"
 Qais>  source "package/valgrind/Config.in"
 Qais>  source "package/pv/Config.in"
 Qais> +source "package/latencytop/Config.in"

This should be in alphabetical order, but I've fixed that.

-- 
Bye, Peter Korsgaard
