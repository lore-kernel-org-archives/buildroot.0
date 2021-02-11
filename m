From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2021 23:21:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/can-utils: enable build using
 musl libc
In-Reply-To: <20210210091319.1392836-1-diego.hdmp@gmail.com> (Diego Hurtado de
 Mendoza's message of "Wed, 10 Feb 2021 10:13:19 +0100")
References: <20210210091319.1392836-1-diego.hdmp@gmail.com>
Message-ID: <87pn16gs9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Diego" == Diego Hurtado de Mendoza <diego.hdmp@gmail.com> writes:

 > From commit 20fb6d3288f3c9aac7975e505d9a25f21f64bdf9 this package was
 > disabled for musl because can-utils used the error() glibc extension
 > at that time.

 > Since then, can-utils fixed compilation on musl by replacing this
 > error() calls with err().
 > https://github.com/linux-can/can-utils/pull/163/commits/791b6de78673f005e9748983231f7260f6b69e99

 > This commit disables the musl check.

 > Signed-off-by: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
