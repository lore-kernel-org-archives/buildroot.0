From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Aug 2017 18:48:01 +0200
Subject: [Buildroot] [PATCH v3 1/2] spidermonkey185: New package.
References: <0dc17f18-b259-a618-67f3-099fd6ef0897@green-communications.fr>
 <1467800649-22119-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20161016120129.4c40ec20@free-electrons.com>
Message-ID: <1rtj5ex8vm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 16 Oct 2016 12:01:29 +0200 schrieb Thomas Petazzoni:

> We have been looking a bit at your patches during the Buildroot meeting
> this week-end. For both patches (spidermonkey185 and couchdb) there have
> been a number of comments. If you're still interested, could you address
> those comments ?

just sent v4 of the spidermonkey patch, oh and yes, it is meant for the 
next branch, just forgot to mention it in the patch subject:
http://patchwork.ozlabs.org/patch/798416/

> Another thing is that CouchDB 2.0 has now been released (on September
> 20), so we would preferably have that version packaged, if possible.

CouchDB 2.1 is just around the corner, the package is not yet finished, I 
am struggeling to get host-erlang-rebar do the right things...

Regards, Bernd
