From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Nov 2012 07:29:25 -0300
Subject: [Buildroot] Fwd: can't resolve symbol 'wctob'
In-Reply-To: <CAJH6qSdrqbOQ_oV6TcitJ0=P5G_A950GvKAOWWfUtvwLAcvhMQ@mail.gmail.com>
References: <CAJH6qSd6eEdg1pUK9e4tOS=1rw0xhN397Q=rx-Rmehi8fPcpeg@mail.gmail.com>
 <CAJH6qSdrqbOQ_oV6TcitJ0=P5G_A950GvKAOWWfUtvwLAcvhMQ@mail.gmail.com>
Message-ID: <50ADFE85.6010306@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/2012 07:20 AM, Vadim Malenboim wrote:

> I have a uclibc based toolchain compiled with application.
> When I try to run it on target I receive - can't resolve symbol 'wctob'
> 
> I understand that it is missing somewhere in the uclibc.
> Where do I need to add it ?

You are missing WCHAR support.
Regards.
