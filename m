From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Sep 2012 22:48:44 +0200
Subject: [Buildroot] [PATCH 1/4] Remove the Xtensa architecture
In-Reply-To: <75b72ff947ad138adcd4b000a1e3bf60c744ffff.1346767209.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
 <75b72ff947ad138adcd4b000a1e3bf60c744ffff.1346767209.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201209042248.44613.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 04 September 2012 16:04:06 Thomas Petazzoni wrote:
> As stated in commit 555c2585bf28c3ef71f6d2dcdd983d17a19892af, the
> Xtensa architecture has been introduced in 2009 and never changed
> since its initial introduction. It requires some special handling that
> is a bit annoying, and despite our call to the initial developers, and
> the announcement of the deprecation of the architecture during the
> 2012.05, nothing has happened. Therefore, drop support for this
> architecture.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: me

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
