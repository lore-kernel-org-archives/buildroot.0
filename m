From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2016 12:42:21 +0100
Subject: [Buildroot] [PATCH 1/1 v3] ypbind-mt: new package
In-Reply-To: <alpine.DEB.2.11.1601130827550.11251@tanhuma.tkos.co.il>
References: <1452516304-6029-1-git-send-email-yba@tkos.co.il>
 <569579C5.1010409@mind.be>
 <alpine.DEB.2.11.1601130827550.11251@tanhuma.tkos.co.il>
Message-ID: <20160113124221.1ae6deeb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Wed, 13 Jan 2016 08:31:43 +0200 (IST), Jonathan Ben Avraham wrote:

> >> This patch adds the ypbind-mt package that contains a multithreaded
> >> ypbind daemon for Linux. It uses threads for better response and
> >> supports the ypbind protocols version 1, 2 and 3. ypbind finds the
> >> server for a given NIS domain and stores information about it in a
> >> binding file on the local host.
> >>
> >
> > You Sob should go here, before the ---
> 
> Hi Arnout,
> I do not understand this comment. Please provide further explanation.

A Git formatted patch looks like this:

=====================================================================

foo: some short description

Here is some longer description that explains what I'm doing, it spans
multiple lines.

And even multiple paragraphs.

Signed-off-by: John Doe <john.doe@acme.com>
---
This is the v2 of the patch, which compared to v1 has such and such
changes.

=====================================================================

When Git will apply this patch, it will discard everything that is
after the "---" line. So:

 * We need the SoB line to be before the "---" sign, because we want
   the SoB line to be preserved in the commit log.

 * We want all informations that should be kept in the Git history
   before the "---" line.

 * We want all informations that should *NOT* be kept in the Git
   history *after* the "---" line.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
