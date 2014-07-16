From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 16 Jul 2014 17:00:51 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <CABbD_XDNK_=CK3A6xQECHr_6-YyccqEcggWg-Mux_sWyv4_uLQ@mail.gmail.com>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <CABbD_XDNK_=CK3A6xQECHr_6-YyccqEcggWg-Mux_sWyv4_uLQ@mail.gmail.com>
Message-ID: <CAJtjsKYTGndyH3wJtHTrqGLcAyuQk8C=MWug2aZ5WqeVviiOvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly,

On Tue, Jul 15, 2014 at 9:27 PM, K?roly Kasza <kaszak@gmail.com> wrote:
>> 3427 enhancement s.martin49 at gmail.com New package: nginx
>
> nginx is not using a "normal" autoconfigure/automake system, so
> cross-compiling it is nearly impossible. I've some experimental patch, which
> still needs a lot of work. I'm not sure if it can be integrated without
> completely rewriting the nginx build infrastructure.

I do use a working nginx patch for my buildroot. It comes from tSed
github, which claims to fix #3427:
https://github.com/tSed/buildroot/commit/9d319a3333b76532e68fb94238feb3cbc2e55d5f

I think he's planning to submit it to this mailing list soon.

Best,

-- 
Johan
