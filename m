From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 17 May 2014 23:15:45 +0200
Subject: [Buildroot] [PATCH v8 15/28] rtmpdump: Add KSV patch
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-16-git-send-email-bernd.kuhls@t-online.de>
 <20140517201125.GG3459@free.fr>
Message-ID: <150l4bx9g4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140517201125.GG3459 at free.fr: 

> Wee... Huge patch without any explanation.
> 
> What is this 'KSV' stuff?
> What does the patch do?
> Why is it needed?

Hi,

KSV is a member of the stream-recorder board, he collects patches to rtmpdump 
and releases them as a combined patch.

My patch contains a link to the forum thread[1] where the patch development 
takes place. That forum post contains a long list of explanations and a 
changelog. Shall I quote that webpage in my patch file?

The patch improves rtmpdump by adding website-specific fixes, for example.
An older version of the patch is used in OpenELEC, btw: 
https://github.com/OpenELEC/OpenELEC.tv/tree/master/packages/multimedia/rtmpd
ump/patches

Regards, Bernd

[1] http://stream-recorder.com/forum/customized-rtmpdump-binaries-patch-file-
t16103.html
