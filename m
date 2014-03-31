From: Marcin Bis <marcin@bis.org.pl>
Date: Mon, 31 Mar 2014 10:55:51 +0200
Subject: [Buildroot] [PATCH v4] bluez5_utils: new package
In-Reply-To: <532F69C8.5060202@trzebnica.net>
References: <532B4158.6070602@trzebnica.net>
 <1395395632-15685-1-git-send-email-marcin@bis.org.pl>
 <532C1D9A.8090109@trzebnica.net> <532C25A2.90907@zacarias.com.ar>
 <532C6CC0.4070608@trzebnica.net> <532C6DDF.2090606@zacarias.com.ar>
 <532F69C8.5060202@trzebnica.net>
Message-ID: <CAOPBCFX+okTq_2rni=DKt1v122LzB4fUq3MSPvGazbY5UH9uog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy, Gustavo

> Gustavo:  Ah, yes, right. Sorry for this and thanks for your clarification.
> Marcin:  Sorry for the noise. Just don't take my comment into consideration.

I am resending v5 of the patch.
- Order of packages in Config.in - not changed
- Unnecessary. leading tab removed.
- I added a comment, so bluez5_utils will not completely disappear
from menuconfig if bluez_utils is selected.

--
 Marcin Bis
