From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jan 2014 19:31:34 +0100
Subject: [Buildroot] [PATCH] prevent recursion in %_defconfig rules
In-Reply-To: <748467273.4509268.1390205590826.JavaMail.root@openwide.fr>
References: <1645253426.4507611.1390204994729.JavaMail.root@openwide.fr>
 <748467273.4509268.1390205590826.JavaMail.root@openwide.fr>
Message-ID: <20140120183134.GA3421@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2014-01-20 09:13 +0100, Jeremy Rosen spake thusly:
> aaand reproduced.
> 
> following the steps described, I get that problem systematically
> 
> I use make 3.81 (debian testing) and I'm not sure what else is
> involved when crashing that early. 
> 
> 
> I tried with LANG=C in case there was anything weird, but apparently not
> 
> My make skills are not very high so i'll gladly take any help on
> figuring that one out...

Please find attached a quick-n-dirty script to test. There are a few
things you can customise inside. Especially, see the list of changesets.

Don't forget to chmod +x the script, obviously! ;-)

Can you report if you observe the same behaviour as the one documented
in the script?

Can you also tweak the script so that it exhibits your failure case, and
repost it back?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: test.sh
Type: application/x-sh
Size: 3257 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140120/602599b8/attachment.sh>
