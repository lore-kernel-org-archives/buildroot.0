From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 15:39:31 +0100
Subject: [Buildroot] Float error on SAMA5D3 Xplained using nodejs
In-Reply-To: <WC20141205142813.1900F2@til-technologies.fr>
References: <WC20141205121112.0100A6@til-technologies.fr>
 <20141205140135.606fff5a@free-electrons.com>
 <WC20141205142813.1900F2@til-technologies.fr>
Message-ID: <20141205153931.722cd4c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
