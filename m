From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jul 2010 17:20:10 +0200
Subject: [Buildroot] [PATCH 1/1] Deprecate the Alpha, IA64,
 Sparc and Sparc64 support
In-Reply-To: <20100726151008.GA10692@merkur.ravnborg.org>
References: <cover.1280155876.git.thomas.petazzoni@free-electrons.com>
	<59f8b962e83de5bd5e13a6eb58530634e5701f0f.1280155876.git.thomas.petazzoni@free-electrons.com>
	<20100726151008.GA10692@merkur.ravnborg.org>
Message-ID: <20100726172010.441c9574@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Mon, 26 Jul 2010 17:10:08 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> I received a SPARC based evaluation board recently:
> 
> http://www.gaisler.com/cms/index.php?option=com_content&task=view&id=339&Itemid=
> 
> Today their Linux support is based on snapgear.
> I looked at more up-to-date alternatives and actually decided
> to go with buildroot (I only considered OpenEmbedded and buildroot).
> 
> But I have made no progress so far (some kconfig stuff to do first).
> 
> Could we hold on with the removal of sparc for the rest of the year?
> I will see if I can get something running.

Yes, sure. Will resend a version that only deprecates Alpha, IA64 and
Sparc64. Don't hesitate to sent patches improving/fixing our Sparc
support for these kind of boards.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
