From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Apr 2013 23:55:05 +0200
Subject: [Buildroot] [PATCH v2 3/3] rootfs-overlay: use a make foreach
 instead of a shell for
In-Reply-To: <1365439816-6935-4-git-send-email-luca@lucaceresoli.net>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
 <1365439816-6935-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <20130416215505.GC16443@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On Mon, Apr 08, 2013 at 06:50:16PM +0200, Luca Ceresoli wrote:
> Makes the code uniform with the post-build and post-image implementation
> (which is slightly simpler and, presumably, more efficient).
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(not tested, I don't have rootfs overlays).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
