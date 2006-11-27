From: David Prime <david@primefarm.co.uk>
Date: Mon, 27 Nov 2006 10:01:07 -0000 (UTC)
Subject: [Buildroot] c++ cross compiler
In-Reply-To: <39d7ed000611270157n68ce8222o7079898ca2185acc@mail.gmail.com>
References: <64405.80.176.236.13.1164581194.squirrel@mail.primefarm.co.uk> 
	<39d7ed000611261547r44bf1d47j1fe03b69c6e44cc4@mail.gmail.com> 
	<12573.80.176.236.13.1164621333.squirrel@mail.primefarm.co.uk>
	<39d7ed000611270157n68ce8222o7079898ca2185acc@mail.gmail.com>
Message-ID: <12736.80.176.236.13.1164621667.squirrel@mail.primefarm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aha. OK, by ported, do you mean copied and pasted to the 4.1 patch dir, or
did you actually port it in some way? If you had to do anything other than
copy it, I would be grateful to know what.

Thanks.

David

On Mon, November 27, 2006 9:57 am, Gilad Rom wrote:
> its the 204-... patch from the toolchain/gcc/4.2.0 directory, and it is
> needed if you intend on building a C++ toolchain. Without it, the build
> simply breaks.
>
> Gilad
>
>
> On 11/27/06, David Prime <david@primefarm.co.uk> wrote:
>
>> I've tried a few:
>>
>>
>> GCC 3.4.6, 4.1, 4.2
>> Using the daily snapshot - although I will try the one you are using to
>> see what happens. What's that monetary_members.cc all about? Is it a
>> fatal mistake not to use that patch or is it just some obscure function
>> that will be broken?
>>
>>
>> David
>>
>>
>>
>> On Sun, November 26, 2006 11:47 pm, Gilad Rom wrote:
>>
>>> I'm using the 20061711 snapshot with gcc-4.1.0, including
>>> the backported monetary_members.cc 4.2.0 patch, and it works fine.
>>>
>>> Which versions are you using?
>>>
>>>
>>>
>>> On 11/27/06, David Prime <david@primefarm.co.uk> wrote:
>>>
>>>
>>>> Hi,
>>>>
>>>>
>>>>
>>>> Anyone with a working arm c++ cross compiler care to share their
>>>> buildroot .config ?
>>>>
>>>>
>>>> When I attempt to build it, it appears not to build the cpp
>>>> libraries to go with it, so when I try to link my programs it all
>>>> fails miserably :(
>>>>
>>>>
>>>>
>>>>
>>>> David
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> buildroot mailing list buildroot at uclibc.org
>>>> http://busybox.net/mailman/listinfo/buildroot
>>>>
>>>>
>>>>
>>>
>>
>> _______________________________________________
>> buildroot mailing list buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>>
>
