From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 23 Jun 2009 18:18:33 +0000 (UTC)
Subject: [Buildroot] How to get symbolic debugging to work?
References: <h1p5br$11r$1@ger.gmane.org>
Message-ID: <h1r69p$kd5$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-06-22, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I've given up temporarily on getting thread support to work in
> gdbserver.  Now I'm just trying (and failing) to get basic
> symbolic debugging to work.

Gdb 6.8 just plain doesn't work for ARM targets.

I switched to 6.7.1, and it works fine (including debugging
multiple threaded apps).

-- 
Grant Edwards                   grante             Yow! My polyvinyl cowboy
                                  at               wallet was made in Hong
                               visi.com            Kong by Montgomery Clift!
