From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 21 Jan 2014 10:39:14 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #6 (deadline
	February 2)
In-Reply-To: <CAAXf6LX+8s0EC9itepQ2aoZK21AkTvQfDdoOa61aAqcwsJms5Q@mail.gmail.com>
References: <CAAXf6LX2yqbapp6GBuN5qoT1R93CGD3NCLguY8fQhFoApJz2uw@mail.gmail.com>
 <52DE28BD.8020306@relinux.de>
 <CAAXf6LX+8s0EC9itepQ2aoZK21AkTvQfDdoOa61aAqcwsJms5Q@mail.gmail.com>
Message-ID: <52DE4042.6060108@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21.01.2014 09:18, Thomas De Schampheleire wrote:
> Hi Stephan,
>
> On Tue, Jan 21, 2014 at 8:58 AM, Stephan Hoffmann <sho@relinux.de> wrote:
>> Am 20.01.2014 22:06, schrieb Thomas De Schampheleire:
>>> All,
>>>
>>> Here is session 6 of the patchwork cleanup. For those who haven't
>>> followed previous sessions, here is a quick recap: every session we'll
>>> be posting the list of the 10 oldest patches, with the original patch
>>> contributors in copy. During two weeks, we have the opportunity to
>>> discuss the patch, whether it is still necessary or not, how it should
>>> be changed to be merged.
>>>
>>> In particular, I'm interested in knowing if the original contributor is
>>> still interested by the patch, or if someone else is interested in
>>> adopting the patch and sending an updated version, or if the patch no
>>> longer makes sense due to other changes made in Buildroot.
>> .....
>>> ...
>>>
>>> Linux: enable local Linux tarball in config
>>> Stephan Hoffmann <sho@relinux.de>
>>> http://patchwork.ozlabs.org/patch/217204
>> Thomas, all,
>>
>> I still think that this would be a useful feature for buildroot,
>> especially when dealing with soc or boards that come with a kernel
>> tarball from the vendor that is not easily accessible online.
>>
> I just looked at your patch, but it is not needed to achieve what you
> want. If you specify:
> file:///path/to/local/file
> then the site method will be automatically set to file (just tested).
> Could you verify that this indeed fits your use case?
Yes, it does, and it does with the old buildroot I had then, too. So my
patch is obsolete, please remove it. I do not remember why I did not
find this last year.

Thanks

Stephan
>
> Thanks,
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de Stephan at reLinux.de
