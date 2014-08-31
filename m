From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 31 Aug 2014 15:15:11 +0200
Subject: [Buildroot] [PATCH for 2014.08] manual/user
 guide/customization: rework section on rootfs customization
In-Reply-To: <20140831124716.GA3908@free.fr>
References: <719dc9b97304bf8fdfbd.1409486840@localhost>
 <20140831124716.GA3908@free.fr>
Message-ID: <CAAXf6LUNy2c+s95aNY4o8sRitW=X6ARL1V9Vg4y5fu06KUZdKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 31, 2014 at 2:47 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-08-31 14:07 +0200, Thomas De Schampheleire spake thusly:
> [--SNIP--]
>> - split post-image to a separate section, as it is not related to the target
>>   filesystem customization
> [--SNIP--]
>> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
>> --- a/docs/manual/customize.txt
>> +++ b/docs/manual/customize.txt
>> @@ -40,6 +40,8 @@
>>
>>  include::customize-rootfs.txt[]
>>
>> +include::customize-post-image.txt[]
>
> Did you forget to 'git add docs/manual/customize-post-image.txt' by
> chance? ;-)

Good catch!

Trying to be too fast... v2 sent just now...
