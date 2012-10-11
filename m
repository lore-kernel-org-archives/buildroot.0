From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 11 Oct 2012 11:21:27 +0200
Subject: [Buildroot] [PATCH 02/11] e2fsprogs: add staging install
In-Reply-To: <87mwzu58fi.fsf@macbook.be.48ers.dk>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-3-git-send-email-s.martin49@gmail.com>
 <87mwzu58fi.fsf@macbook.be.48ers.dk>
Message-ID: <CAHXCMMJFJW3tWKER-=SqzzF62LM58yuZyuG1nvwhqnSnu6QbFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/10 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
>  Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Why? As far as I can see we don't have anything depending on e2fsprogs,
> and the libuuid stuff moved to util-linux, didn't it?
Well... so far, none that I'm aware of need e2fsprogs, though some
people tried to add some packages that need it some months ago.
So, maybe we could just skip this patch until someone/some package need it.

-- 
Sam
