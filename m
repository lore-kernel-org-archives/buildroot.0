From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 May 2013 22:59:27 +0200
Subject: [Buildroot] [PATCH] Standardisation of $(BUILD)/.root name
In-Reply-To: <19013645.b0LZFaBj4B@sagittae>
References: <1368541851-31089-1-git-send-email-jezz@sysmic.org>
 <2999958.1S5Q3eWKd9@sagittae> <20130514222324.GA8043@free.fr>
 <19013645.b0LZFaBj4B@sagittae>
Message-ID: <20130515205927.GB3265@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-05-15 08:19 +0200, J?r?me Pouiller spake thusly:
> On Wednesday 15 May 2013 00:23:24 Yann E. MORIN wrote:
> [...]
> > > I cannot just add a dependency between
> > > $(STAMP_DIR)/skeleton-target-installed and  $(STAMP_DIR).
> > 
> > Why not? Like:
> >     $(STAMP_DIR)/skeleton-target-installed: $(STAMP_DIR)
> > 
> > which to me looks like the sane solution (and not what I previosuly
> > answered Arnout about $(TARGET_DIR))
> Because, $(STAMP_DIR)/skeleton-target-installed will be rebuilt each time a 
> file is added or removed from $(STAMP_DIR).

Indeed. Sigh. Too short-sighted I was...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
