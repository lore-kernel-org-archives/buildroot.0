From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 15:21:43 +0200
Subject: [Buildroot] [PATCH 1/1] Add libvirt (KVM) support
In-Reply-To: <76055cea-ec05-aad3-1f27-39e07b48b12b@lecroq.be>
References: <20190215173607.13773-1-christopher@lecroq.be>
 <20190413222137.6c0cba37@windsurf>
 <da50400b-6cf2-d87a-3a51-c54a46b7cea6@lecroq.be>
 <a4a04e64-bf89-f21b-89fe-7b3e5b1e5d69@mind.be>
 <CA+_SqVYm9vpx+Uuktb+s_TYu+Hzpu258AfNhUUkBTRK7K_SuOQ@mail.gmail.com>
 <76055cea-ec05-aad3-1f27-39e07b48b12b@lecroq.be>
Message-ID: <25259681-75b6-fe4b-bb4b-e9a903f48058@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo, Christopher,

On 15/04/2019 16:54, Christopher Peeters wrote:
> On 15/04/2019 16:06, Angelo Compagnucci wrote:
>> On Mon, Apr 15, 2019 at 2:23 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>  Hi Christopher,
>>>
>>>  Plese don't top-post, but reply inline like I do below.
>>>
>>> On 15/04/2019 09:46, Christopher Peeters wrote:
>>>> Hi Thomas,
>>>>
>>>> Thank you for your email. I wasn't aware about the commit title
>>>> conventions so I will fix this.
>>>>
>>>> The reason why I selected a different distribution is the lack of
>>>> support for Libvirt by the original distribution.
>>>  I would prefer in that case that we always use this other distribution (which
>>> is actually the same distribution, right? bionic == ubuntu1804...).
>> I wouldn't like to use this distribution if possible, is not the
>> official one and not maintained by canonical. The official one is:
>>
>> https://app.vagrantup.com/ubuntu/boxes/bionic64
> As I said before there's no support from Canonical for libvirt images.
> This can only be solved by Canonical. And if I look at Launchpad, it
> won't happen very soon. There's another question for LXC support open
> for more then a year now.
> 
> An other option when preferring official images is to switch over to one
> of the following boxes since they do understand that source projects
> should support each other and therefore have support for libvirt in
> their Vagrant boxes. I haven't tested them though.
> 
> - https://app.vagrantup.com/debian/boxes/stretch64

 Without understanding all this vagrant stuff, I would say that simply switching
away from Ubuntu and to Debian sounds like the right thing to do, no? Debian
stable is definitely a distro we want to have supported at all times.

 Regards,
 Arnout

> 
> - https://app.vagrantup.com/centos/boxes/7
> 
> - https://app.vagrantup.com/fedora/boxes/29-atomic-host
> 
> - https://app.vagrantup.com/opensuse/boxes/openSUSE-15.0-x86_64
> 
> - https://app.vagrantup.com/archlinux/boxes/archlinux
> 
