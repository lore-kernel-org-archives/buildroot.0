From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jul 2014 23:52:55 +0200
Subject: [Buildroot] [PATCH 2/5] support/download: properly use temp
	files
In-Reply-To: <53BC1F5D.2050407@mind.be>
References: <cover.1404681878.git.yann.morin.1998@free.fr>
 <3c2e529b6f9c542dba662b08b54f844f275e23ee.1404681878.git.yann.morin.1998@free.fr>
 <53BA3A1A.1000307@mind.be> <20140707213802.GC3806@free.fr>
 <53BC1F5D.2050407@mind.be>
Message-ID: <20140708215255.GG4384@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-07-08 18:42 +0200, Arnout Vandecappelle spake thusly:
> On 07/07/14 23:38, Yann E. MORIN wrote:
> > On 2014-07-07 08:11 +0200, Arnout Vandecappelle spake thusly:
[--SNIP--]
> >>  Not that it makes a real difference, but I think that 'cp' is a more natural
> >> way to do this.
> > 
> > I am not sure how cp handles copying over an existing file. I'll
> > check...
> 
>  It does. It only unlinks if open(O_TRUNC) fails. (Checked with strace for
> coreutils and my reading the source for busybox.)

I'll rework the entire series to take your and Jacmet's comments in
consideration.

Thanks for the reviews! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
