From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 09:25:40 +0100
Subject: [Buildroot] [PATCH 2/5] manual: add a make target
 'manual-update-lists'
In-Reply-To: <CAHXCMMJenyhQiKPp+vKbcM_c280ghGVeAG9tsGxtXnR0s3b0CA@mail.gmail.com>
References: <cover.1363063387.git.s.martin49@gmail.com>
 <da0b536e458646ecade2fd7d2a8cee2e04148e66.1363063387.git.s.martin49@gmail.com>
 <20130312085945.7d595fb2@skate>
 <CAHXCMMJMP5o34AAX29Rx0HqWOtysCz4bFJNrMo+pyHYBf0++fg@mail.gmail.com>
 <20130313083959.49853d83@skate>
 <CAHXCMMJenyhQiKPp+vKbcM_c280ghGVeAG9tsGxtXnR0s3b0CA@mail.gmail.com>
Message-ID: <20130320092540.4b14570b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 19 Mar 2013 22:52:11 +0100, Samuel Martin wrote:

> > I'm not sure to understand the problem with the dates. I'd say you
> > shouldn't put the date specifically in the list of packages. I would
> > expect "make manual-pdf" to generate the list of packages with your
> > script, get it included into the manual sources, and get the manual
> > built.
> >
> > Separately, we may want to introduce something at the beginning of the
> > manual that says at which date the manual was built, and on which Git
> > version of the Buildroot sources. But I don't see a reason to make this
> > related to the list of packages specifically.
> Just to be sure, here, you mean something like a non-versioned version.txt file,
> which would be automatically generated and included in manual.txt?

Yes, something like that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
