From: Sylvain LG <forum@sylvainlegourr.com>
Date: Fri, 4 Dec 2015 14:26:50 +0100
Subject: [Buildroot] Mosh and buildroot: UTF-8 locale issue
Message-ID: <CAK9TtU2RHCgLAJnpL9Wq6Oao99VsB3Q7F1UeUiPsM_TZGH87uQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've just built a filesystem with Buildroot and I've selected Mosh package.

But an error appears when I try to connect with Mosh to my system:

$ mosh root at 192.168.1.10

The locale requested by LC_CTYPE=UTF-8 isn't available here.
> Running `locale-gen UTF-8' may be necessary.
> mosh-server needs a UTF-8 native locale to run.
> Unfortunately, the local environment ([no charset variables]) specifies
> the character set "US-ASCII",
> The client-supplied environment (LC_CTYPE=UTF-8) specifies
> the character set "US-ASCII".
> sh: locale: not found
> Connection to 192.168.1.10 closed.
> /usr/local/bin/mosh: Did not find mosh server startup message.

How can I set Buildroot config to fix the issue?


Thank you,


Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151204/2e5002c2/attachment.html>
