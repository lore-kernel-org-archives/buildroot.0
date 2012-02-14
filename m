From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Feb 2012 23:31:22 +0100
Subject: [Buildroot] [PATCH] mxml: Use correct paths when installing
	into staging.
In-Reply-To: <CAFbHwiTkv--e=XwpfQ6hb6j-091dN2QS29xz8axcMrR7Em+wRw@mail.gmail.com>
 (Will Newton's message of "Tue, 14 Feb 2012 18:04:50 +0000")
References: <CAFbHwiTkv--e=XwpfQ6hb6j-091dN2QS29xz8axcMrR7Em+wRw@mail.gmail.com>
Message-ID: <8739adujwl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> The DSTROOT option passed for the staging install would install
 Will> into the target directory, which is not what was intended.

Committed, thanks.

-- 
Bye, Peter Korsgaard
