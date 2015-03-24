From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2015 19:56:07 +0100
Subject: [Buildroot] [PATCH v3] Restructure root password handling
In-Reply-To: <1427199224-16413-1-git-send-email-lorenzo@sancho.ccd.uniroma2.it>
References: <1427153435-31605-1-git-send-email-lorenzo@sancho.ccd.uniroma2.it>
 <1427199224-16413-1-git-send-email-lorenzo@sancho.ccd.uniroma2.it>
Message-ID: <20150324185607.GB4023@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lorenzo, All,

On 2015-03-24 13:13 +0100, Lorenzo M. Catucci spake thusly:
> Created a top level boolean entry to enable/disable root login
> 
> Allow choosing the root password input format only if root login
> is enabled.

I've sent an updated two-patch series that should supersedes that one.
It is much simpler (IMHO), and more in-line with what we would be
ready to accept, I guess.

Thank you for providing this initial work! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
