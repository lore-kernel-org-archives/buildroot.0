From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Mar 2015 21:26:32 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/unixodbc: new package
References: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
 <54FED8D0.5020406@zacarias.com.ar>
Message-ID: <XnsA45CDA1F6B1E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote in 
news:54FED8D0.5020406 at zacarias.com.ar:

> According to my tests it needs threads

Hi Gustavo,

I managed to fix the compile error related to a wrong pthread detection 
scheme: http://patchwork.ozlabs.org/patch/450089/

Regards, Bernd
