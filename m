From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 2 May 2019 15:24:52 +0200
Subject: [Buildroot] make source not working for host-ldd crosstool-ng
In-Reply-To: <3116_1556792466_5CCAC492_3116_470_1_20190502102103.GB3431@r-lnx-nyma7486-2>
References: <cdf1cac9-9fb4-06ee-1d3f-44907d67dc51@ginzinger.com>
 <3116_1556792466_5CCAC492_3116_470_1_20190502102103.GB3431@r-lnx-nyma7486-2>
Message-ID: <f674a6be-994f-12c6-16fd-432ee62fea40@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02.05.19 12:21, yann.morin at orange.com wrote:
> Martin, All,
> 
> On 2019-05-02 11:50 +0200, Martin Kepplinger spake thusly:
>> There seems to be a bug in the host-ldd crosstool-ng package. It
>> unconditionally tries to download "gpl.txt", even after running make
>> source. It should check if it's already available. See the error below,
>> when running "make" disconnected.
>>
>> Who's responsible here?
> 
> Probably you, because there is no such package in the official Buildroot
> tree, so either you patched it yourself (and hence are responsible), or
> it is in your br2-external tree (hence you are responsible), or you are
> using a fork of Buildroot (hence you should talk to the ones you got
> your fork from).
> 

sorry, you're right -.- Apparently I can't think today.

thanks

                            martin


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190502/0f2553c1/attachment.bin>
