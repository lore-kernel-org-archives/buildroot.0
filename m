From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Apr 2015 23:49:31 +0200
Subject: [Buildroot] [PATCH 2/7 v4] package infra: do not check hashes
 when downloading from a repository
In-Reply-To: <551DB6EA.3050209@mind.be>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
 <b172905fe4ddd1944cc14df21cc33d527c755a80.1427840060.git.yann.morin.1998@free.fr>
 <551DB6EA.3050209@mind.be>
Message-ID: <20150402214931.GC4229@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-02 23:38 +0200, Arnout Vandecappelle spake thusly:
> On 01/04/15 00:15, Yann E. MORIN wrote:
> > When downloading from a repository, we have no way to ensure the
> > reproducibility of the generated archives, so we can't check the hashes.
> > 
> > Do not specifiy a hash file in those cases.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  And now I also reviewed the manual update.

Well, I think I just used what you provided in your previous review, so
I assumed your reviewed-by tag was still valid... ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
