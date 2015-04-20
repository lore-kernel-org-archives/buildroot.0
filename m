From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Apr 2015 19:45:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/tor: new package
References: <1427638949-3191-1-git-send-email-bernd.kuhls@t-online.de>
 <1427638949-3191-2-git-send-email-bernd.kuhls@t-online.de>
 <CAHkwnC_aKhRJezdfbxiMVq6ZsTSGrk-jmns7b7M5Yht3s9HpVA@mail.gmail.com>
Message-ID: <XnsA482C8EF8C79berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio Porcedda <fabio.porcedda@gmail.com> wrote 
in news:CAHkwnC_aKhRJezdfbxiMVq6ZsTSGrk-jmns7b7M5Yht3s9HpVA at mail.gmail.com:

>> +TOR_VERSION = 0.2.5.11
> 
> What about adding the latest version available (0.2.6.7)?

Hi,

https://www.torproject.org/download/download.html.en

"The current stable version of Tor is 0.2.5.12." (will update my patch)

"The current unstable/alpha version of Tor is 0.2.6.7."

Afaik it is the policy of the buildroot project not to ship alpha versions of 
software.

Regards, Bernd
