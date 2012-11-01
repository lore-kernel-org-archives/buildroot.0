From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2012 18:25:12 +0100
Subject: [Buildroot] [PATCH 2/7] support/scripts: add a script to add a
	new package
In-Reply-To: <5091D7B6.8070703@mind.be>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
 <5091D7B6.8070703@mind.be>
Message-ID: <201211011825.13012.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 01 November 2012 Arnout Vandecappelle wrote:
> On 09/10/12 01:40, Yann E. MORIN wrote:
> > This script asks a few questions to the user, and creates the skeleton
> > files (Config.in and package.mk).
[--SNIP--]
> > +# --------------------------------------
> > +# Can't use 'cat<<-_EOF_', as Config.in uses leading tabs.
> 
>   I don't think the indented Config.in block is very readable; I'd use a
> plain <<_EOF_ with no extra indentation.  Then you can use cat after all.

Hmm. Maybe that's because my default tabstop is 4, not 8.
I just tried with 8, and it is indeed less readable.

Yet, I prefer that here-documents be indented rather than not.
I'll see to make it readable for tabstop=8.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
