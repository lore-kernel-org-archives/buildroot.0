From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Oct 2014 15:03:38 +0200
Subject: [Buildroot] [PATCH 3/3] support/script/scancpan: add option test
In-Reply-To: <CAB0FRst6dN48SqBR8UTn3WzOrZi1oMrtgijgqDO74E=X7xLh-Q@mail.gmail.com>
References: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
 <1412188619-3981-3-git-send-email-francois.perrad@gadz.org>
 <20141001213402.553f2999@free-electrons.com>
 <CAB0FRst6dN48SqBR8UTn3WzOrZi1oMrtgijgqDO74E=X7xLh-Q@mail.gmail.com>
Message-ID: <20141003150338.36800f3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Fri, 3 Oct 2014 14:57:21 +0200, Fran?ois Perrad wrote:

> find below an improved message for this patch
> 
> """
> Between Perl modules, there are 3 kinds of dependency:
>  - configure/build time dependency which becomes host dependency
>  - runtime dependency which becomes target dependency
>  - test time dependency which is useless in a cross-compiling context like BR
> 
> Before this patch, test time dependencies are handled like runtime dependencies.
> 
> After this patch, test time dependencies are ignored by default.
> The new option -test allows to add them anyway.
> """

Looks, much, much better. I understand now.

Thanks for the better commit message!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
