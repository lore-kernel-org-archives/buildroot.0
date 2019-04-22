From: Radu Rendec <radu.rendec@gmail.com>
Date: Mon, 22 Apr 2019 14:47:03 -0400
Subject: [Buildroot] Avoid rebuilding host build tools
Message-ID: <CAD5jUk-8uJd7EOvFTdkrBdV3-xtu1CSOHVqn3-aGn7in1n+DBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everyone,

Is there any easy way to avoid rebuilding most of the host build tools,
such as autoconf, automake, libtool, m4 and bison?

All these tools are already installed on the host system from distro
packages and are fairly new versions. Is there any good reason to
rebuild them anyway (e.g. strict version dependencies)?

Thanks,
Radu Rendec
