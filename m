From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 06 Sep 2011 15:12:47 +0200
Subject: [Buildroot] ncurses: build error
In-Reply-To: <19dc87b07567423c140c1d303a3f968c@zacarias.com.ar>
References: <4E66159C.5070309@visionsystems.de>
 <4E66169D.70209@visionsystems.de>
 <19dc87b07567423c140c1d303a3f968c@zacarias.com.ar>
Message-ID: <4E661C4F.1050505@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 06.09.2011 15:04, schrieb Gustavo Zacarias:
> On Tue, 06 Sep 2011 14:48:29 +0200, Yegor Yefremov wrote:
>
>> reverting two latest commits till
>> 7d584285c8b32d8a419f8a5fb40efce66e8e5e24 got compilation working.
>> My build system opensuse 10.3
>>
>> Yegor
>
> Try my "ncurses: fix host build breakage" patch, it fixes it for me without the need to revert (we want host tic).
> Regards.

Thanks. That helped. I somehow overlooked this patch.

Yegor
