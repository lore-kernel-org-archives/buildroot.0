From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 8 Dec 2015 23:26:01 +0100
Subject: [Buildroot] [PATCH 3/4] package/lttng-tools: backport patch
 fixing pthread_setname_np failure
In-Reply-To: <20151208200858.GR4188@free.fr>
References: <1449092893-30664-1-git-send-email-s.martin49@gmail.com>
 <1449092893-30664-3-git-send-email-s.martin49@gmail.com>
 <20151208200858.GR4188@free.fr>
Message-ID: <CAHXCMM+XLCRDXL=T3wbGgkEummVoyRD34W_gH_-_u-gzFu41eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Dec 8, 2015 at 9:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2015-12-02 22:48 +0100, Samuel Martin spake thusly:
>> This patch, backported from upstream, prevent the build from failing due
>> to:
>>
>>   [...]
>>     CCLD     lttng-consumerd
>>   ../../../src/common/.libs/libcommon.a(runas.o): In function `run_as_worker':
>>   /tmp/br/build/lttng-tools-2.7.0/src/common/runas.c:325: undefined reference to `pthread_setname_np'
>>   collect2: error: ld returned 1 exit status
>>   Makefile:475: recipe for target 'lttng-consumerd' failed
>>   [...]
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Same comment as for patch 2:
>
>     https://git.lttng.org/?p=lttng-tools.git;a=commit;h=b8090274814e5f6a22cff0dd656e14769cc7a7df

Thanks, I'll respin the series with the updates soon.

Regards,

-- 
Samuel
