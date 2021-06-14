From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 18:21:21 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/bitcoin: unset the NDEBUG
 flag
In-Reply-To: <ZTnoZb2MMbi5Z7xbG_3OKXXEj07hBkAAiKJqWo8-ke0zvQ3NE7ETdQHmw4oDe6M6YEnyDdQxIGltbNk15VM_w7hY-F7CQq8U-rG5VWRj7Uk=@senzilla.io>
References: <ZbTvPhursXFsHDblON1mtNTQnG937Il2N0wYa3ReI@cp4-web-037.plabs.ch>
 <20210613195850.GT168928@scaer>
 <ZTnoZb2MMbi5Z7xbG_3OKXXEj07hBkAAiKJqWo8-ke0zvQ3NE7ETdQHmw4oDe6M6YEnyDdQxIGltbNk15VM_w7hY-F7CQq8U-rG5VWRj7Uk=@senzilla.io>
Message-ID: <20210614162121.GA2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2021-06-14 10:06 +0000, D. Olsson spake thusly:
> On Sunday, June 13th, 2021 at 9:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> Signed-off-by: Dick Olsson hi at senzilla.io
> > Applied to master, thanks.
> Should we apply this to the 'next' branch as well?
> The bitcoin build is currently broken there.

Branch 'next' is closed; it has been merged back into master with commit
8d07baab43, dated 2021-06-07.

> But I'm not sure exactly how the 'master' and 'next'
> branches are managed?

https://buildroot.org/downloads/manual/manual.html#RELENG

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
