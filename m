From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jul 2010 22:50:56 +0200
Subject: [Buildroot] [PATCH 1/1] Deprecate the Alpha, IA64,
	Sparc and	Sparc64 support
In-Reply-To: <20100726151008.GA10692@merkur.ravnborg.org> (Sam Ravnborg's
	message of "Mon, 26 Jul 2010 17:10:08 +0200")
References: <cover.1280155876.git.thomas.petazzoni@free-electrons.com>
	<59f8b962e83de5bd5e13a6eb58530634e5701f0f.1280155876.git.thomas.petazzoni@free-electrons.com>
	<20100726151008.GA10692@merkur.ravnborg.org>
Message-ID: <87aapedl1r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sam" == Sam Ravnborg <sam@ravnborg.org> writes:

Hi Sam,

 Sam> I received a SPARC based evaluation board recently:

 Sam> http://www.gaisler.com/cms/index.php?option=com_content&task=view&id=339&Itemid=

Careful about that, can be a real time sink ;)

 Sam> Today their Linux support is based on snapgear.
 Sam> I looked at more up-to-date alternatives and actually decided
 Sam> to go with buildroot (I only considered OpenEmbedded and buildroot).

 Sam> But I have made no progress so far (some kconfig stuff to do first).

 Sam> Could we hold on with the removal of sparc for the rest of the year?
 Sam> I will see if I can get something running.

Sure.

-- 
Bye, Peter Korsgaard
