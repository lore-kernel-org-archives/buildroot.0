From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 11:11:41 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <CAB0FRsssGoXoq7+Ft=Cku0jexY=c1wBf-p4XK2v=F8RyDRH8Mw@mail.gmail.com>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <CAB0FRsssGoXoq7+Ft=Cku0jexY=c1wBf-p4XK2v=F8RyDRH8Mw@mail.gmail.com>
Message-ID: <CAAXf6LX2OxYtyY_-uJ7C1kwVyDeYNMjJt8L0-BKNmRdis=MzaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 7, 2013 at 10:45 AM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
> Thomas,
>
> at the end of the command, the initial title is restored, so try
> something like :
> $ echo -e "\033]2;Foo\007" && wait
>

This also doesn't change anything for me.
