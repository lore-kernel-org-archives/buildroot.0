From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 9 Feb 2010 19:01:19 +0100
Subject: [Buildroot] 'make' in buildroot with proxy and ftp not available
In-Reply-To: <SNT129-W82FE6851F0AD37F987C26B9500@phx.gbl>
References: <SNT129-W82FE6851F0AD37F987C26B9500@phx.gbl>
Message-ID: <201002091901.19212.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 09 February 2010 17:56:57 Tony Mozi wrote:
> --2010-02-09 17:44:17--  http://www.kernel.org/pub//linux/kernel/v2.6/
> /linux-2.6.31.6.tar.bz2 
> R?solution de www.kernel.org... 130.239.17.4, 199.6.1.164
> Connexion vers www.kernel.org|130.239.17.4|:80... ?chec: Connexion termin?e
> par expiration du d?lai d'attente. 
> Connexion vers www.kernel.org|199.6.1.164|:80... 

It's attemptimg direct connection without using the proxy.
And BTW, next time try with an english locale, not every one on the
list is able to read french:
  LC_ALL=C make

> Well, I add the proxy 'export http_proxy="http://<username>:<password>@<proxy URL>:<port>/
> I have no username and no password.
> So I do 'export http_proxy="http://:@titi.toto.fr:1234/

export ftp_proxy="http://titi.toto.fr:1234/"
export http_proxy="http://titi.toto.fr:1234/"
export https_proxy="http://titi.toto.fr:1234/"

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
