From: Vadim Malenboim <vadim@tangotec.com>
Date: Thu, 22 Nov 2012 12:48:47 +0200
Subject: [Buildroot] Fwd: can't resolve symbol 'wctob'
In-Reply-To: <50ADFE85.6010306@zacarias.com.ar>
References: <CAJH6qSd6eEdg1pUK9e4tOS=1rw0xhN397Q=rx-Rmehi8fPcpeg@mail.gmail.com>
 <CAJH6qSdrqbOQ_oV6TcitJ0=P5G_A950GvKAOWWfUtvwLAcvhMQ@mail.gmail.com>
 <50ADFE85.6010306@zacarias.com.ar>
Message-ID: <CAJH6qSde3UfP0=bQH0C=EDAGRFA3AVezNE=hUT6y41=b9vegtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I suspected that this is the issue, however I specially added it in the
configuration.
I'll do another build from scratch adding the WCHAR.

Thank you.

On Thu, Nov 22, 2012 at 12:29 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar>wrote:

> You are missing WCHAR support.
>



-- 
     * Vadim Malenboim.*
      Low Level Software Engineer.

      Cellular : +972(544)925862
      E-Mail   : vadim at tangotec.com
      WEB     : www.tangotec.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121122/bb84ca5e/attachment.html>
