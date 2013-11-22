From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 23:35:27 +0100
Subject: [Buildroot] [PATCHv2] haveged: new package
In-Reply-To: <1384863032-18124-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384863032-18124-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20131122223527.GB3371@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2013-11-19 09:10 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +	help
> +	  The haveged project is an attempt to provide an easy-to-use,
> +	  unpredictable random number generator based upon an adaptation
> +	  of the HAVEGE algorithm.

There was a talk at LinuxCon 2012 (last year) in Barcelonna, by H Peter
Anvin, titled "Don't play dice with random numbers", where he said he
was very skeptic about HAVEGE:
    https://lwn.net/Articles/525459/

Quote:
    Most of the papers that he has read run along the lines, "we took the
    output from HAVEGE, and ran some tests on it and all of the tests passed".

    One of Peter's colleagues replaced the random input source employed
    by HAVEGE with a constant stream of ones. All of the same tests passed.

    So, while I can't really recommend it, I can't not recommend it either.

Thought I would mention it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
