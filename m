From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Fri, 21 Feb 2020 18:08:59 -0000 (UTC)
Subject: [Buildroot] SSH server starts too late
References: <CAGSpp9=qDFdtuETT8shQPXim25V7Yw2jvpjihbJgrttozOBVSQ@mail.gmail.com>
 <20200221111947.33e4677d@gmx.net>
 <CAGSpp9nYVE28LS2F5y97Xc0X_oXVJa8HDOiZKj73N7LOgMyGMA@mail.gmail.com>
Message-ID: <r2p6br$27r7$1@ciao.gmane.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-02-21, Hammami Omar <omar18hammami@gmail.com> wrote:

> By too late, I mean that my ssh server starts ~20 seconds later comparing
> to the normal  (Old buildroot version in my case).

Does it generate a new host key each time it starts?

-- 
Grant Edwards               grant.b.edwards        Yow! Is a tattoo real, like
                                  at               a curb or a battleship?
                              gmail.com            Or are we suffering in
                                                   Safeway?
