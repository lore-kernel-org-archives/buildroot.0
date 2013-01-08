From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Jan 2013 00:21:28 +0100
Subject: [Buildroot] new <pkg>_CONFIG_FIXUP variable
In-Reply-To: <50EB4BC6.6020807@petroprogram.com>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <201301072310.10765.yann.morin.1998@free.fr>
 <50EB4BC6.6020807@petroprogram.com>
Message-ID: <201301090021.28343.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Monday 07 January 2013 Stefan Fr?berg wrote:
[--SNIP--]
> God...
> It seems that doing documentation for all these things is going to take
> more work than the actual patch itself

Well, in my view, the code is actually only one fourth of the work.
The other three fourth are split thus:
  - 1/4 tests
  - 1/4 documentation
  - 1/4 the rest: commit message, discussing, regression-testing,
        forensic analysis...

In some cases, the code and tests are quickly done, because simple, and
the doc takes 90% of the time.

Other times, the documentation is easily written, but the code is very
complex to write, and the tests very hard to write and run.

Sometimes, discussing an issue is what takes the longest, for finally
very simple pieces of code, test and documentation.

And it can happen that an issue is very hard to identify, and it takes a
very long time to find a suitable fix.

All in all, in my experience, that's roughly split in those four fourths.
Comunity work like here, and professional work alike.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
