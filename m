From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 12:31:56 +0200
Subject: [Buildroot] [PATCH v3 1/4] support/scripts: add fix_rpaths
In-Reply-To: <20150713102407.GM2451@tarshish>
References: <1436782677-12557-1-git-send-email-s.martin49@gmail.com>
 <20150713102407.GM2451@tarshish>
Message-ID: <CAHXCMMLWnPxhCPAOfbrYSrygpmyLLbZt9ZQpRdZzznvh2fNZJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 13, 2015 at 12:24 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Samuel,
>
> On Mon, Jul 13, 2015 at 12:17:54PM +0200, Samuel Martin wrote:
>> This pyhton script leverages patchelf program to fix the RPATH of binaries.
>>
>> It offers 2 actions:
>> - clear the RPATH;
>> - set the RPATH using relative paths between every single binary and the
>>   libraries directories.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v2->v3:
>> - no change
>
> Have you seen my comments on v2 at
> http://lists.busybox.net/pipermail/buildroot/2015-July/132446.html?
Ooops! i missed it! :-s

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -



-- 
Samuel
