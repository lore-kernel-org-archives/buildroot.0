From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 21 Jan 2014 11:20:09 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #6 (deadline
	February 2)
In-Reply-To: <52DE4042.6060108@relinux.de>
References: <CAAXf6LX2yqbapp6GBuN5qoT1R93CGD3NCLguY8fQhFoApJz2uw@mail.gmail.com>
 <52DE28BD.8020306@relinux.de>
 <CAAXf6LX+8s0EC9itepQ2aoZK21AkTvQfDdoOa61aAqcwsJms5Q@mail.gmail.com>
 <52DE4042.6060108@relinux.de>
Message-ID: <CAAXf6LX+3MuF3GxM33bhKdoDPiDpcr93iL-Ot_JRBOcuQ8iVDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 21, 2014 at 10:39 AM, Stephan Hoffmann <sho@relinux.de> wrote:
[..]
>>>> Linux: enable local Linux tarball in config
>>>> Stephan Hoffmann <sho@relinux.de>
>>>> http://patchwork.ozlabs.org/patch/217204
>>> Thomas, all,
>>>
>>> I still think that this would be a useful feature for buildroot,
>>> especially when dealing with soc or boards that come with a kernel
>>> tarball from the vendor that is not easily accessible online.
>>>
>> I just looked at your patch, but it is not needed to achieve what you
>> want. If you specify:
>> file:///path/to/local/file
>> then the site method will be automatically set to file (just tested).
>> Could you verify that this indeed fits your use case?
> Yes, it does, and it does with the old buildroot I had then, too. So my
> patch is obsolete, please remove it. I do not remember why I did not
> find this last year.

Ok, great that we sorted this out. I'll mark the patch as rejected in patchwork.

Thanks,
Thomas
