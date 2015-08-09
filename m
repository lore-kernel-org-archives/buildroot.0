From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Aug 2015 22:01:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/jsoncpp: bump version to
	1.6.5
References: <1439123310-6602-1-git-send-email-bernd.kuhls@t-online.de>
 <20150809145443.GB2570@tarshish>
 <1439143511.12501.11.camel@embedded.rocks>
Message-ID: <d6ok9cxek9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 09 Aug 2015 20:05:11 +0200 schrieb J?rg Krause:

> I already submitted a patch for jsoncpp version bump and removing the
> snprintf-patch:
> http://patchwork.ozlabs.org/patch/502324/

Hi J?rg,

sorry, I did not notice. I think your patch is better because it takes 
care of the non-c11 toolchains but, as discussed, could you please keep 
the snprintf patch? Therefore I marked my patch as superseded ;)

Regards, Bernd
