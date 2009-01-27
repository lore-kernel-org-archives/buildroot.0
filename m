From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 14:14:25 +0100
Subject: [Buildroot] PATCH: linuxthreads and arm compile fix
In-Reply-To: <497F06CD.3040203@carallon.com> (Will Wagner's message of "Tue\,
	27 Jan 2009 13\:06\:21 +0000")
References: <497F06CD.3040203@carallon.com>
Message-ID: <87ab9c28ni.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Doing a default config with linuxthreads and arm fails to compile due
 Will> to missing headers. The attached patch adds the headers. After
 Will> applying this patch it all seems to work.

The non default BR2_PTHREADS thing? I don't know much about the
pthreads stuff, could you send the patch by the uclibc list instead to
hear what they think?

-- 
Bye, Peter Korsgaard
