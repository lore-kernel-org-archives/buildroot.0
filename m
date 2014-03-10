From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 10 Mar 2014 18:52:47 +0100
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
 <20140310173941.GA3282@free.fr>
Message-ID: <eoa1vaxos4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140310173941.GA3282 at free.fr: 

> Maybe it would be nice to give in the commit log a bit more details on
> why it makes sense to move it out of x11r7.

mesa3d does not depend on x11, it can be used by wayland as well.

> If I understand correctly, mesa3d is an implementation of OpenGL. So,
> *maybe* it would make sense to move it along the other OpenGL packages,
> into package/opengl/.

In package/opengl/ are only virtual packages.

Regards, Bernd
