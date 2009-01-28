From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 16:49:43 +0100
Subject: [Buildroot] PATCH: linuxthreads and arm compile fix
In-Reply-To: <497F06CD.3040203@carallon.com> (Will Wagner's message of "Tue\,
	27 Jan 2009 13\:06\:21 +0000")
References: <497F06CD.3040203@carallon.com>
Message-ID: <87y6wvtoq0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Doing a default config with linuxthreads and arm fails to compile due
 Will> to missing headers. The attached patch adds the headers. After
 Will> applying this patch it all seems to work.

Thanks, committed as r25103.

-- 
Bye, Peter Korsgaard
