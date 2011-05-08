From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 8 May 2011 17:20:43 +0200
Subject: [Buildroot] PATH
In-Reply-To: <20110508083541.66044mwno728t7ok@www.home.zuerker.org>
References: <20110508081440.78203647owixiiio@www.home.zuerker.org>
	<201105081523.44670.yann.morin.1998@anciens.enib.fr>
	<20110508083541.66044mwno728t7ok@www.home.zuerker.org>
Message-ID: <201105081720.44414.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On Sunday 08 May 2011 15:35:41 Heiko Zuerker wrote:
> Quoting "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>:
> > In my opinion, . in the path is a Really Bad Idea (TM), and should not
> > only be avoided, but entirely banned.
> Just curious, why are you against having . in the path?

Security hole. For example, see:
  http://fixunix.com/unix/88657-whats-wrong-having-my-$path.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
