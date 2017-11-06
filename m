From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Nov 2017 22:37:08 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <73877e9b-d049-3184-2c16-76094987c787@mind.be>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
 <20171105084630.GF2996@scaer>
 <CABhNV22jMFZdR8mp4ss_21XPmt2r8GmcLoahdn48_HsM9+RTpQ@mail.gmail.com>
 <73877e9b-d049-3184-2c16-76094987c787@mind.be>
Message-ID: <20171106213708.GC2763@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-11-06 22:34 +0100, Arnout Vandecappelle spake thusly:
> On 06-11-17 10:43, Einar J?n wrote:
[--SNIP--]
> > But supplying the SOURCE_DATE_EPOCH from Jenkins is fine by me. So the
> > fix is great.
> 
>  So, will you make a patch that fixes it?

It has alreday been applied by Peter yesterday:

    0437d2f8f6e core/reproducible: do not override SOURCE_DATE_EPOCH

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
