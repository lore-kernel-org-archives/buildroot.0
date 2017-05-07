From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 May 2017 14:08:07 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/kodi-skin-confluence: new
	package
References: <20170429203608.17700-1-bernd.kuhls@t-online.de>
 <20170501074621.GA3118@scaer>
Message-ID: <7af3udxufq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 01 May 2017 09:46:21 +0200 schrieb Yann E. MORIN:

> Like for other Kodi packages, should we add "on the Krypton branch" ?

Hi Yann,

ftr: The confluence package contains only the master branch.

On April 30th the author committed
https://github.com/xbmc/skin.confluence/commit/
e2b5a9693d016643fa92b8b867aa3b80657fb5e4

with "Kodi v18 'Leia' version" as comment.

I did not test git HEAD with Kodi v17 yet but I suppose that we should 
not update this package until the next Kodi bump.

Regards, Bernd
