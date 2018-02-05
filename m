From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Feb 2018 08:21:36 +0100
Subject: [Buildroot] [PATCH 0/5] support/docker: generate reproducible
 base images
In-Reply-To: <87vafcwjuo.fsf@dell.be.48ers.dk>
References: <cover.1517755438.git.yann.morin.1998@free.fr>
 <87vafcwjuo.fsf@dell.be.48ers.dk>
Message-ID: <20180205072136.GB2417@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-02-04 22:00 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Currently, we only ever refer to the "latest" version of the image.
>  > This is not nice because:
>  >   1. this is not reproducible;
>  >   2. we can't have different images between master and the various
>  >      maintenance branches.
>  > So, this series makes the generated image reproducible, and explains how
>  > to gnerate and push a tagged image.
>  > Once this series has been applied, we'll have to generate such a tagged
>  > image and update our .gitlab-ci.yml accordingly.
> 
> Committed series, thanks - You are now officially our Docker expert ;)

Oh, now, we do have Cam Hutchison as an expert! ;-)

I'll regenerate the image now, push it, and update our .gitlab-ci.yml
now. Expect patch any minute now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
