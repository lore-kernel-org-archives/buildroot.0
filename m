From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 28 Jul 2013 13:56:41 +0200
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <51F50077.2060204@zacarias.com.ar>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
 <51DFDA1F.60904@zacarias.com.ar>
 <CAAXf6LWVWj-Z2Od9Zc=QjWELd3_R+5MQ+gTBo=dO-VgFiDoxGg@mail.gmail.com>
 <51F50077.2060204@zacarias.com.ar>
Message-ID: <CAAXf6LXt7LzmRU+iWDM1_55f+AjwocG=NTpEzTVgWMZaCONoRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 28, 2013 at 1:28 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 07/28/2013 05:33 AM, Thomas De Schampheleire wrote:
>
>> So what do we do with this patch?
>> I ask it because it's still marked as 'New' in patchwork:
>> http://patchwork.ozlabs.org/patch/258619/
>> If we agree that it shouldn't be needed, I suggest to mark it as such.
>> If someone can come up with a proven failure scenario, we can still reopen it.
>>
>> What do you think?
>
> Proven failure: not building a kernel with buildroot.

Agreed. So in this case, the patch can be helpful.

One question then about it: what is the purpose of the 2>/dev/null ?
How would echo fail?

Thanks,
Thomas
