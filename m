From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 22:09:15 +0200
Subject: [Buildroot] [PATCH 1/1] upmpdcli: new package
In-Reply-To: <20140716203540.5ec29da4@free-electrons.com>
References: <1405371167-25884-1-git-send-email-jkrause@posteo.de>
 <20140714215113.GO3684@free.fr>
 <20140716203540.5ec29da4@free-electrons.com>
Message-ID: <20140716200915.GH9252@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Joerg, All,

On 2014-07-16 20:35 +0200, Thomas Petazzoni spake thusly:
> On Mon, 14 Jul 2014 23:51:13 +0200, Yann E. MORIN wrote:
> 
> > > +# Upmpdcli only runs if user upmpdcli exists
> > > +define UPMPDCLI_USERS
> > > +	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli: MPD UPnP Renderer Front-End
> > 
> > You're adding this user, but nowhere do you seem to use it to run the
> > upmpdcli daemon. What am I missing?
> 
> It's automatically used by the upmpdcli daemon, which expects this user
> to exist, as explained by the comment above.

/me rubs his eyes...
Doh... Indeed...
/me hides... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
