From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Nov 2012 07:53:58 -0300
Subject: [Buildroot] Fwd: can't resolve symbol 'wctob'
In-Reply-To: <CAJH6qSde3UfP0=bQH0C=EDAGRFA3AVezNE=hUT6y41=b9vegtg@mail.gmail.com>
References: <CAJH6qSd6eEdg1pUK9e4tOS=1rw0xhN397Q=rx-Rmehi8fPcpeg@mail.gmail.com>
 <CAJH6qSdrqbOQ_oV6TcitJ0=P5G_A950GvKAOWWfUtvwLAcvhMQ@mail.gmail.com>
 <50ADFE85.6010306@zacarias.com.ar>
 <CAJH6qSde3UfP0=bQH0C=EDAGRFA3AVezNE=hUT6y41=b9vegtg@mail.gmail.com>
Message-ID: <50AE0446.3090702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/2012 07:48 AM, Vadim Malenboim wrote:

> I suspected that this is the issue, however I specially added it in the
> configuration.
> I'll do another build from scratch adding the WCHAR.
> 
> Thank you.

Yes, changing toolchain options requires a complete rebuild.
Regards.
