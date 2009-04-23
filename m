From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 20:41:25 +0200
Subject: [Buildroot] svn commit: [26195] trunk/buildroot/package/qtopia4
In-Reply-To: <d6cda7730904230927j18346c76ie7207660af0301f6@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Thu\, 23 Apr 2009
	13\:27\:08 -0300")
References: <20090423124937.4166977108@busybox.osuosl.org>
	<d6cda7730904230927j18346c76ie7207660af0301f6@mail.gmail.com>
Message-ID: <87mya7mcve.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi,
 Thiago> On Thu, Apr 23, 2009 at 9:49 AM,  <jacmet@uclibc.org> wrote:
 >> -QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source
 >> +QTOPIA4_SITE=http://get.qtsoftware.com/qt/source

 Thiago> That's a fix that didn't need fixing, ftp.trolltech.com works
 Thiago> perfectly too.

Sure, but we normally use http URLs where possible as they more often
work behind firewalls than ftp ones.

 Thiago> Well, as long as it works, it's fine by me.

 Thiago> I've just received an email from Nokia/Qt Software that 4.5.1 is out,
 Thiago> I will update the version as soon as I finish testing if the x86
 Thiago> workaround is still necessary or not.

Great!

-- 
Bye, Peter Korsgaard
