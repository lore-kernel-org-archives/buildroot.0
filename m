From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 19 Mar 2019 15:23:34 -0000 (UTC)
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
Message-ID: <q6r1hm$26sl$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-03-19, Esben Haabendal <esben.haabendal@gmail.com> wrote:

> What do you think. Is this kind of micro-management of a
> configuration file something that I should keep out of tree?

I don't have a strong opinion either way.  I've always done things
like that (including that exact setting change) with a postbuild
script.  That works well for me, and it's actually kind of nice having
all those custom configuration changes in that one place.

-- 
Grant Edwards               grant.b.edwards        Yow! I want to so HAPPY,
                                  at               the VEINS in my neck STAND
                              gmail.com            OUT!!
