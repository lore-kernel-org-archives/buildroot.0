From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 14:36:24 +0200
Subject: [Buildroot] [PATCHv5 3/4] Makefile: implement a size-stats
	target
In-Reply-To: <20150903142127.528cbc63@free-electrons.com>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441228505-23235-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150903102905.GC3689@free.fr>
 <20150903142127.528cbc63@free-electrons.com>
Message-ID: <20150903123624.GA3607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-09-03 14:21 +0200, Thomas Petazzoni spake thusly:
> On Thu, 3 Sep 2015 12:29:05 +0200, Yann E. MORIN wrote:
[--SNIP--]
> > I would however have called this something like graph-sizes, so it is in
> > line with the other graph-generating targets.
> 
> It used to be called graph-size, until I changed the code to also
> generate CSV files. So now it doesn't generate just a graph, but also
> raw CSV data, which is why I changed to size-stats. If despite that
> you think "make graph-size" remains a better naming, I'm fine with
> changing back.

Well, can't we consider the csv files as by-products? The main and
primary purpose is to generate the graphs, so I'd still call that
graph-size. Having 'graph-' as a prefix also helps classify the rule
with the other graph-generating rules.

But I don't really mind...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
