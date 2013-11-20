From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 20 Nov 2013 13:45:51 +0200
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131119003049.313dbb8d@skate>
References: <20131116223632.462c6e60@skate> <528A9F9C.6040401@mind.be>
 <20131119003049.313dbb8d@skate>
Message-ID: <201311201345.51644.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 19 November 2013 01:30:49 Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Tue, 19 Nov 2013 00:15:40 +0100, Arnout Vandecappelle wrote:
> >  One more:
> > http://autobuild.humanoidz.org/results/05f/05ff0f5ea99df806589c9d2c0aa5d9
> > 91ae299f5c/
> > 
> >  -> passing 'const QAtomicPointer<pcre16_extra>' as 'this' argument of
> >  'T* QBasicAtomicPointer<T>::loadAcquire() [with T = pcre16_extra]'
> >  discards qualifiers -> upstream bug, fixed in Fedora
> >  https://bugzilla.redhat.com/attachment.cgi?id=812643
> >  
> >  Unfortunately, seems Fedora didn't upstream it.
> >  
> >  I don't have time to test the patch, so perhaps someone else can take
> > 
> > it over?
> 
> Since this is a Qt5 issue, let's Cc Fatih. He has been very efficient
> on fixing Qt5 problems, and on upstreaming the relevant patches.
> 
> Fatih, do you think you could have a look at the above problem?

Sent a patch to the list.

Also reported to upstream: https://codereview.qt-project.org/71763
