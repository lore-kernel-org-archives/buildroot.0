From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 07 Oct 2019 20:30:40 -0300
Subject: [Buildroot] [PATCH 3/4] support/testing: add lua-sdl2 test
References: <CAB0FRssw_DRYgXsGOhfrme7uwykkkGQM0gVQOTze0rrEb48n1A@mail.gmail.com>
Message-ID: <5d9bcaa0a86f7_301a3fe7761555344368@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 07, 2019 at 01:06 AM, Fran?ois Perrad wrote:

> Le lun. 7 oct. 2019 ? 02:07, Ricardo Martincoski <
> ricardo.martincoski at gmail.com> a ?crit :
> 
>> Hello,
>>
>> On Sun, Sep 29, 2019 at 09:55 AM, Francois Perrad wrote:
[snip]
>> > +tests.package.test_lua_sdl2.TestLuaLuaSDL2: { extends: .runtime_test }
>> > +tests.package.test_lua_sdl2.TestLuajitLuaSDL2: { extends: .runtime_test
>> }
>>
>> These 2 test cases failed for me:
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517926
>> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/312517929
>>
>>
> Ricardo,
> 
> you need this fix https://patchwork.ozlabs.org/patch/1172611/

Thank you, I will reply with my tags to both patches.


Regards,
Ricardo
