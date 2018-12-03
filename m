From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 3 Dec 2018 15:40:27 +0100
Subject: [Buildroot] [PATCH 15/15] ejabberd: Bump to version 18.09
In-Reply-To: <20181203140919.eep447v4yoykd5dr@localhost>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
 <20181126110807.31431-16-johan.oudinet@gmail.com>
 <20181128224322.42641f73@windsurf.home>
 <CAJtjsKZ+FF0cHtTWVQN6b74R08XuLXvPP6ta1ObNtTbo5ckcJA@mail.gmail.com>
 <20181203140919.eep447v4yoykd5dr@localhost>
Message-ID: <CAJtjsKYq_otg3-p6716bwyDJNPBbwLj9CrhwHQM4SPZHsorrRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 3, 2018 at 3:09 PM Christophe Romain
<cromain@process-one.net> wrote:
>
> -- Johan Oudinet [2018-12-03 15:00:55 +0100]:
>
> >For p1_oauth2, [...]
> >I would assume it is a runtime dependency. Christophe, can you
> >confirm?
>
> Yes, it's runtime dependency
>
> >For jiffy, it is a JSON parser which is used in several parts of Ejabberd.
> >I think it is a runtime dependency as well. Christophe, do you agree?
>
> Yes, it's used by BOSH, ACME and REST features as well

Thanks Christophe. I'll add this information to Ejabberd's Config.in,
as suggested by Thomas.

-- 
Johan
