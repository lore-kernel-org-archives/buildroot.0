From: Vadim Malenboim <vadim@tangotec.com>
Date: Thu, 22 Nov 2012 12:20:52 +0200
Subject: [Buildroot] Fwd: can't resolve symbol 'wctob'
In-Reply-To: <CAJH6qSd6eEdg1pUK9e4tOS=1rw0xhN397Q=rx-Rmehi8fPcpeg@mail.gmail.com>
References: <CAJH6qSd6eEdg1pUK9e4tOS=1rw0xhN397Q=rx-Rmehi8fPcpeg@mail.gmail.com>
Message-ID: <CAJH6qSdrqbOQ_oV6TcitJ0=P5G_A950GvKAOWWfUtvwLAcvhMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a uclibc based toolchain compiled with application.
When I try to run it on target I receive - can't resolve symbol 'wctob'

I understand that it is missing somewhere in the uclibc.
Where do I need to add it ?


-- 
     * Vadim Malenboim.*
      Low Level Software Engineer.

      Cellular : +972(544)925862
      E-Mail   : vadim at tangotec.com
      WEB     : www.tangotec.com





-- 
     * Vadim Malenboim.*
      Low Level Software Engineer.

      Cellular : +972(544)925862
      E-Mail   : vadim at tangotec.com
      WEB     : www.tangotec.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121122/d88a1723/attachment.html>
