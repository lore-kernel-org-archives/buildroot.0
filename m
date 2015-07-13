From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 17:18:58 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix generatign keys on RO
 file systems
In-Reply-To: <20150713150147.GU2451@tarshish>
References: <1436798945-6869-1-git-send-email-yann.morin.1998@free.fr>
 <20150713150147.GU2451@tarshish>
Message-ID: <20150713151858.GK4008@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-07-13 18:01 +0300, Baruch Siach spake thusly:
> On Mon, Jul 13, 2015 at 04:49:05PM +0200, Yann E. MORIN wrote:
> > +	if ! [ -d /etc/dropbear ]; then
> > +		if ! rm -f /etc/dropbear; then
> 
> 'rm -f' always succeeds.

No, it does not succeeds if the filesystem is readonly.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
