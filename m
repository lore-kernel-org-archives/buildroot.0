From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Mar 2016 21:49:28 +0100
Subject: [Buildroot] [PATCH] [RFC] DO NOT APPLY Remove usr/ component
 from HOST_DIR
In-Reply-To: <1444914910-5370-1-git-send-email-arnout@mind.be>
References: <1444914910-5370-1-git-send-email-arnout@mind.be>
Message-ID: <20160308204928.GA14289@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-10-15 15:15 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
[--SNIP--]
> This patch replaces all occurences of 'host/usr' (in its various forms)
> with 'host', and updates relative paths accordingly.

As discussed on IRC: Ping?  ;-)

The idea would be to go with a symlink usr -> . to start with, so that
we can apply it right now on the spot, and fix packagres one by one in
multiple steps (possibly later).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
