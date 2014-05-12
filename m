From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 12 May 2014 13:21:01 +0200
Subject: [Buildroot] [PATCH] cmake: disable building of ccmake
In-Reply-To: <536A6FE0.4060007@lucaceresoli.net>
References: <1399480839-30134-1-git-send-email-fabio.porcedda@gmail.com>
 <536A6FE0.4060007@lucaceresoli.net>
Message-ID: <CAHkwnC-3_5XuJHNx3gdURcA+_qiZrLnuuPpOcGefi1s_6jc1zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 7, 2014 at 7:39 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi Fabio,
>
>
> Fabio Porcedda wrote:
>>
>> The ccmake program requires the ncurses package so it fails to build if
>> the host system does not have it installed.
>> To get rid off the ncurses dependency do not build anymore the ccmake
>> program because it's not needed by buildroot.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>> Cc: Samuel Martin <s.martin49@gmail.com>
>> Cc: Alexander Potashev <aspotashev@gmail.com>
>
>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

I've sent an updated patch:
http://patchwork.ozlabs.org/patch/347975/

Best regards
-- 
Fabio Porcedda
