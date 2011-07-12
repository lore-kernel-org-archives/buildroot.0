From: Niall Parker <stuff@pender.dnsalias.net>
Date: Tue, 12 Jul 2011 16:16:16 -0700
Subject: [Buildroot] adding libgphoto2
In-Reply-To: <20110604103844.7cb3a129@surf>
References: <4DE33733.6090305@pender.dnsalias.net>
 <20110604103844.7cb3a129@surf>
Message-ID: <4E1CD5C0.3050008@pender.dnsalias.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-06-04 01:38 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Sun, 29 May 2011 23:20:35 -0700
> Niall Parker<stuff@pender.dnsalias.net>  wrote:
>
>> I've been using buildroot 2011.02 and was trying to libgphoto2 and
>> was following the howto in the docs (also copying the libusb
>> Config.in and .mk with tweaks). Unfortunately it wasn't a trivial
>> task and it is complaining it needs libltdl ...
>>
>>> checking dynamic linker characteristics... GNU/Linux ld.so
>>> checking how to hardcode library paths into programs... immediate
>>> checking ltdl.h usability... no
>>> checking ltdl.h presence... no
>>> checking for ltdl.h... no
>>> checking that we can compile and link with libltdl... no
>>> configure: error: cannot compile and link against libltdl
>>> libgphoto2 requires libltdl (the libtool dl* library),
>>> but cannot compile and link against it.
>>> Aborting.
>> I have enabled libtool in the package selection but evidently the
>> autoconf isn't finding it. Any suggestions on where to start ?
> Can you share the current status of your patch, so that we can try to
> help you starting from where you are ?
>
> Regards,
>
> Thomas
Thanks for the reply, took a little while to figure out generation of 
the patch (new to git, was working from released tarball) ... hopefully 
this is what you are looking for. Definitely not working yet, not 
finding the libltdl ...

                  ... Niall



-------------- next part --------------
A non-text attachment was scrubbed...
Name: libgphoto2.patch
Type: text/x-patch
Size: 1590 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110712/a96391c3/attachment.bin>
