From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 6 Nov 2012 22:09:26 +0100
Subject: [Buildroot] [PATCH v11 2/9] perl: new package
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
 <1350652434-32020-2-git-send-email-francois.perrad@gadz.org>
 <upcp6k.3q9.ln@bernd-kuhls.de>
 <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
 <50986270.4070804@mind.be> <20121106080812.4e7bd01a@skate>
Message-ID: <6aub7k.9fm.ln@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20121106080812.4e7bd01a at skate:

> I guess this whole qemu thing for Perl is going to be annoying on the
> long term. We might need to start looking for a different option, i.e
> seeing how to get Perl to build without needing qemu.

Hi,

maybe this can be of help: http://perlcross.berlios.de/

Kind regards, Bernd

PS: The reason I am fiddling around with Perl is to compile 
Mail::Spamassassin which needs a lot of other modules.
