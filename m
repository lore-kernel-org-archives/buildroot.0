From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 3 Feb 2017 09:17:13 -0500
Subject: [Buildroot] Checking the size of the output images
Message-ID: <CAF_dkJBqGLEdB3q3qKNK+Nk0-SkY4dSz_g3j9XVnmwvpwAeRPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a buildroot standard way to check the size of the zImage file
produced to ensure that it will fit in a particular flash partition?

I can invent one, but I'd rather follow existing examples, and it
seems to me that this should probably be a common enough scenario that
others have already address it.

--wpd
