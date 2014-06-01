From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 1 Jun 2014 15:23:57 +0200
Subject: [Buildroot] [PATCH] graph-depends: refactor with more color
In-Reply-To: <20140531203324.GE3522@free.fr>
References: <1401564012-23822-1-git-send-email-francois.perrad@gadz.org>
 <20140531203324.GE3522@free.fr>
Message-ID: <CAB0FRsuy94wo81ybkcFNkwZBg3sOPs-jAx+4RZ7S1nJM8AXtaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-05-31 22:33 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Farn?ois, All,
>
> On 2014-05-31 21:20 +0200, Francois Perrad spake thusly:
>> target and host packages don't use the same background color
>> +            color = 'gainsboro'
>> +        else:
>> +            color = 'grey'
>
> The difference between 'gainsboro' and 'grey' is very light. At first, I
> thought I had forgotten to apply your patch, so the difference is light.
>
> Did you choose it on-purpose? Did you choose it because it really looks
> different when printed?

I don't like flashy color.
Feel free to experiment another set of color (don't forget black&white
printing).
See http://graphviz.org/content/color-names

Fran?ois

>
> I'd like we get colours that are visually different, both on-display and
> printed. I'll try to find a better default that is more visually
> different, and add a new option to specify alternate colours.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
