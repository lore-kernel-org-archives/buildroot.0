From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 21:46:06 +0200
Subject: [Buildroot] Pending "big" patch series
In-Reply-To: <CAAXf6LVsjr8V5hgGO0oNsQSzA9dtFvTvv8PQhA-+KE3qtvL7gA@mail.gmail.com>
References: <20140914125321.0d68b842@free-electrons.com>
 <CAAXf6LVsjr8V5hgGO0oNsQSzA9dtFvTvv8PQhA-+KE3qtvL7gA@mail.gmail.com>
Message-ID: <20140914194606.GD21222@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-14 20:41 +0200, Thomas De Schampheleire spake thusly:
> Hi Thomas,
> 
> On Sun, Sep 14, 2014 at 12:53 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
[--SNIP--]
> >  * packages: rename _OPT into _OPTS (2 patches)
> >    http://lists.busybox.net/pipermail/buildroot/2014-July/103082.html
> >
> >    Thomas DS, could you respin this patch series?
> 
> First question is: do you accept the principle of the change?
> If the patches are acceptable, then clearly I can rebase them.

I think the renaming makes sense, even more so since we do catch the old
names (especiually usefull for br2-external.)

So even though it is not transparent, the user is not left clueless 
s to why his packages no longer build or install.

So, you have my backing on this series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
