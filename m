From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 May 2013 22:59:54 +0200
Subject: [Buildroot] [PATCH v2] Add support for plain URL in
	$(PKG)_PATCH variable
In-Reply-To: <1368460312-9566-1-git-send-email-jezz@sysmic.org>
References: <517A1C3D.1010009@mind.be>
 <1368460312-9566-1-git-send-email-jezz@sysmic.org>
Message-ID: <20130513205954.GB29762@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2013-05-13 17:51 +0200, J?r?me Pouiller spake thusly:
> Until now, $(PKG)_PATCH allow only to download patches from same URL than tarball.
> This patch allow to detect when plain URL are used in $(PKG)_PATCH and correctly
> handle them.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
