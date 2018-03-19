From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Mar 2018 22:32:40 +0100
Subject: [Buildroot] Unicode problem with check-uniq-files
In-Reply-To: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
References: <3a25e768-759e-e377-fcae-48c8e3e36ddd@jcz.nl>
Message-ID: <20180319213240.GA340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jaap, All,

On 2018-03-19 21:45 +0100, Jaap Crezee spake thusly:
> Anybody familiar with the following problem?
> 
> >>>   Finalizing target directory
> # Check files that are touched by more than one package
> ./support/scripts/check-uniq-files -t target /data/work/jcz/git/jidiot/clients/innr/buildroot/output/build/packages-file-list.txt

Could you please attach this packages-file-list.txt please?

Regards,
Yann E. MORIN.

> Traceback (most recent call last):
>   File "./support/scripts/check-uniq-files", line 42, in <module>
>     sys.exit(main())
>   File "./support/scripts/check-uniq-files", line 31, in main
>     for row in r:
>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>     return codecs.ascii_decode(input, self.errors)[0]
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc5 in position 6473: ordinal not in range(128)
> make: *** [Makefile:699: target-finalize] Error 1
> 
> 
> Running on 8a94ff12d232ada68cff5957089a78a1f0b8f192 / 2018.02.x
> 
> regards,
> 
> 
> Jaap Crezee
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
