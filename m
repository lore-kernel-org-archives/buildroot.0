From: =?iso-8859-1?Q?C=E9dric?= HEYMAN <c.heyman@til-technologies.fr>
Date: Mon, 08 Dec 2014 12:30:28 +0100
Subject: [Buildroot] Float error on SAMA5D3 Xplained using nodejs
In-Reply-To: <20141205153931.722cd4c1@free-electrons.com>
References: <WC20141205121112.0100A6@til-technologies.fr>
 <20141205140135.606fff5a@free-electrons.com>
 <WC20141205142813.1900F2@til-technologies.fr>
 <20141205153931.722cd4c1@free-electrons.com>
Message-ID: <WC20141208113028.33021D@til-technologies.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Unfortunately, we are not using git on our buildroot-2014.11 repository as I 
got the corresponding tarball to install it, and we actually archive under 
SVN on an internal server.

Is there another simple way to submit patch ?

Thanks
  	
C?dric HEYMAN
Ing?nieur en D?veloppement embarqu?

T?l : 04.42.37.17.10| Fax : 04.42.24.28.98
Si?ge social : 350 rue de la Lauzi?re - Parc du Golf B?t 43 - CS 60481 - 
13592 AIX-EN-PROVENCE CEDEX 3



-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: "C?dric HEYMAN" <c.heyman@til-technologies.fr>
Cc: "buildroot at uclibc.org" <buildroot@uclibc.org>
Date: Fri, 5 Dec 2014 15:39:31 +0100
Subject: Re: [Buildroot] Float error on SAMA5D3 Xplained using nodejs

Dear C?dric HEYMAN,

Please keep the list in Cc, thanks.

On Fri, 05 Dec 2014 15:28:13 +0100, C?dric HEYMAN wrote:
> This patch solves the bug, thanks for your efficient support.
>
> npm command result is now OK :
> # npm
>
> Usage: npm <command>
>
> where <command> is one of:
>     add-user, adduser, apihelp, author, bin, bugs, c, cache,
>     completion, config, ddp, dedupe, deprecate, docs, edit,
>     explore, faq, find, find-dupes, get, help, help-search,
>     home, i, info, init, install, isntall, issues, la, link,
>     list, ll, ln, login, ls, outdated, owner, pack, prefix,
>     prune, publish, r, rb, rebuild, remove, repo, restart, rm,
>     root, run-script, s, se, search, set, show, shrinkwrap,
>     star, stars, start, stop, submodule, t, tag, test, tst, un,
>     uninstall, unlink, unpublish, unstar, up, update, v,
>     version, view, whoami
>
> npm <cmd> -h     quick help on <cmd>
> npm -l           display full usage info
> npm faq          commonly asked questions
> npm help <term>  search for help on <term>
> npm help npm     involved overview
>
> Specify configs in the ini-formatted file:
>     /root/.npmrc
> or on the command line via: npm <command> --key value
> Config info can be viewed via: npm help config
>
> npm at 1.4.28 /usr/lib/node_modules/npm

Cool, nice to see that it works!

> Do I or do you submit patch ? (if me, please briefly indicate me how).

Feel free to submit a patch. You will find some guidelines at
http://buildroot.org/downloads/manual/manual.html#submitting-patches.

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

<font face="Tahoma" size="1" color="#575F5E">
<a href="http://www.til-technologies.fr/bandeau_signature/redirection.html" target="_blank">
<img src="http://www.til-technologies.fr/bandeau_signature/bandeau.jpg" width="600" height="80" border="0" alt="Plus d'actualit?s sur www.til-technologies.fr" />
</a>
<br>
Les informations pr?c?dentes peuvent ?tre confidentielles ou privil?gi?es. Si vous n'?tes pas le destinataire pr?vu de ce mail, veuillez en notifier l'exp?diteur en r?pondant ? ce message puis supprimez-en toute trace de vos syst?mes.
</font>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141208/6673c266/attachment.html>
