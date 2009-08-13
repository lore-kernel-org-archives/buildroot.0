From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 13 Aug 2009 16:37:09 +0200
Subject: [Buildroot] Explicit dependencies on uclibc in makefiles
In-Reply-To: <87a5b0800908130719m79b677dbm1e3c12bd9dafddaf@mail.gmail.com>
References: <87a5b0800908110855g778df6aanbf9307ca69e676c9@mail.gmail.com>
	<d6cda7730908130705s11275a7cu78d2dbca3ee15041@mail.gmail.com>
	<87a5b0800908130719m79b677dbm1e3c12bd9dafddaf@mail.gmail.com>
Message-ID: <20090813163709.044199e3@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2009 15:19:48 +0100
Will Newton <will.newton@gmail.com> wrote:

<snipp>

> Why does bash depend on uclibc but grep doesn't? Does grep have a bug
> or can we remove the unneeded dependency from bash?
>

IIRC uclibc is earlier in the dependency loop anyway, uclibc is in the
BASE_TARGETS list. See top level Makefile.


-- 
Best regards,
Hans-Christian Egtvedt
