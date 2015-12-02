From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Wed, 02 Dec 2015 20:38:52 +0200
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151202173134.GB23754@vapier.lan>
References: <20151202073542.GY23754@vapier.lan> <565EB926.6030809@mail.bg>
 <20151202173134.GB23754@vapier.lan>
Message-ID: <565F3ABC.5030500@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On 12/02/2015 07:31 PM, Mike Frysinger wrote:
> On 02 Dec 2015 11:25, Nikolay Dimitrov wrote:
>> On 12/02/2015 09:35 AM, Mike Frysinger wrote:
>>> the busybox.net software has been languishing for quite a long time,
>>> so i gave it a strong kick today.  just about every piece of software
>>> has been upgraded on the box including bugzilla.  my various testing
>>> looks like it still works, but if you guys notice anything weird, feel
>>> free to let me know.
>>> -mike
>>
>> I started seeing this warning in the last few days:
>>
>> Cloning into 'buildroot'...
>> remote: warning: unable to access '/root/.config/git/attributes':
>> Permission denied
>> ...
>
> i fixed that once, but my fix was reset.  i've made it work in a diff
> way now though so you shouldn't see that again.
> -mike

Seems to work better now. Thanks!

Regards,
Nikolay
