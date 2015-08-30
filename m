From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Aug 2015 22:12:05 +0200
Subject: [Buildroot] [PATCH] package/dropbear: add warning about
	volatile keys
In-Reply-To: <87si70tud5.fsf@dell.be.48ers.dk>
References: <1440539013-23389-1-git-send-email-yann.morin.1998@free.fr>
 <87si70tud5.fsf@dell.be.48ers.dk>
Message-ID: <20150830201205.GA1786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-08-30 22:05 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > When the rootfs is read-only, keys will be generated in a volatile
>  > location, which is inherently bad as host keys will change on each boot,
>  > rendering virtually useless.
> +them

Ack.

>  > Add a warning so the user is at least aware of the issue.
> 
>  > Consign the rm output to oblivion, to avoid noisy output, now that we
>  > have a proper warning.
> 
> Is consign a English word? I changed it to 'hide' as I think that is clearer.

Yes, it is:
    http://www.merriam-webster.com/dictionary/consign

    to put (something that is not wanted or used) in a place where old
    things are stored or thrown away

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
