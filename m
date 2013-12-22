From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 19:39:44 +0100
Subject: [Buildroot] [PATCH] uclibc: add a special Xtensa version
In-Reply-To: <20131222183218.GA4180@tarshish>
References: <1387734039-15203-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131222183218.GA4180@tarshish>
Message-ID: <20131222193944.3e1abd5c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 22 Dec 2013 20:32:18 +0200, Baruch Siach wrote:

> Thanks of looking into this. Commit 9591091f1 is quite old, however, and is 
> missing a few important xtensa fixes like a20d9fe539 and caee562063. Since 
> this breakage is new, It's probably related to the commits pushed to public 
> git repo in the last few days. Specifically I suspect 2a021ae81c3 (buildsys: 
> update unifdef), but I didn't look too deeply into it.

Aah, I looked at http://git.uclibc.org/uClibc/log/ where the last
commit is 9591091f1. There is (again) a cache problem, because this is
indeed not the latest commit, as can be seen at
http://git.uclibc.org/uClibc/log/?h=master.

> Can you verify that 3a3ad3dfc1 as default uClibc version for xtensa doesn't 
> break the builds? 

I'll try that.

> BTW, I'd also appreciate your response on 
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/72570.

Aaah, yes, I need to have a look into this one. Thanks for the reminder.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
