From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Aug 2014 11:42:32 +0200
Subject: [Buildroot] [PATCH 1/1] dependencies: Reject gcj in
	BR2_NEEDS_HOST_JAVA check
References: <1407356782-3118-1-git-send-email-bernd.kuhls@t-online.de>
 <20140813141110.GF3939@free.fr>
 <XnsA388C38E9A3BAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140813212312.GI3939@free.fr>
Message-ID: <XnsA38B771BEC920berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20140813212312.GI3939 at free.fr:

> check_prog_host already calls 'which $1' so we're sure we can call 'java'.

Hi,

ok, I am going to send v2 with your suggestion added, but I would like to 
keep the $JAVA_GCJ part to have a nicer looking error message, examples:

gij (GNU libgcj) version 4.7.2 is not sufficient to compile your package 
selection.
Please install an OpenJDK/IcedTea/Oracle Java.

gij (GNU libgcj) version 4.6.3 is not sufficient to compile your package 
selection.
Please install an OpenJDK/IcedTea/Oracle Java.

Regards, Bernd
