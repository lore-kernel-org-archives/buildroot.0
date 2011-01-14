From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 18:14:37 +0100
Subject: [Buildroot] [PATCH] htop: new package
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EED6864@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EE63C42@EXV1.corp.adtran.com>
	<20110114085941.6df4841d@surf>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EED6864@EXV1.corp.adtran.com>
Message-ID: <20110114181437.63bbb7a1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jan 2011 10:14:33 -0600
ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:

> > Your patch is word-wrapped. Could you check your e-mail
> > client configuration ? You should probably try git send-email, as this
> > will guarantee that your patches will make it properly to the list,
> > without being word-wrapped or damaged in anyway by the mail client
> > you're using.
> 
> GGGGRRRRR!!!  I'm using Outlook and I'm behind an Exchange server.  To
> that end, will git sendmail work?

No. Tell your network administrator that not having a real SMTP server
prevents you from working efficiently. There's nothing useful you can
do without a real SMTP server.

Of course, if you can SSH out to another box that has a SMTP server
available, that would work.

> > None of those options are perfect, but we'd like to avoid adding
> dozens
> > and dozens of options at the Buildroot level to tweak every possible
> > option of uClibc.
> 
> Nah, no reason to.  The HTOP guys say that their next release will auto
> detect the presence of backtrace and use it if it is there, so we'll
> skip right on past 0.9 when they get it fixed.

Great.

> > Patch lacks a description of why it is needed and the Signed-off-by
> > line.
> 
> Hmm, so naming the file htop-cross-no-proc-check is not sufficient for
> the comment?  Will fix and resubmit.

In that case, I admit it's a bit silly, but that's the rule :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
