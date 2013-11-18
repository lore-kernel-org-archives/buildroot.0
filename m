From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 00:30:49 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <528A9F9C.6040401@mind.be>
References: <20131116223632.462c6e60@skate> <20131117172917.GB4425@free.fr>
 <20131117175034.GC4425@free.fr> <528A9F9C.6040401@mind.be>
Message-ID: <20131119003049.313dbb8d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 19 Nov 2013 00:15:40 +0100, Arnout Vandecappelle wrote:

>  One more:
> 
> http://autobuild.humanoidz.org/results/05f/05ff0f5ea99df806589c9d2c0aa5d991ae299f5c/
>  -> passing 'const QAtomicPointer<pcre16_extra>' as 'this' argument of 'T* QBasicAtomicPointer<T>::loadAcquire() [with T = pcre16_extra]' discards qualifiers
>  -> upstream bug, fixed in Fedora https://bugzilla.redhat.com/attachment.cgi?id=812643
> 
>  Unfortunately, seems Fedora didn't upstream it.
> 
>  I don't have time to test the patch, so perhaps someone else can take
> it over?

Since this is a Qt5 issue, let's Cc Fatih. He has been very efficient
on fixing Qt5 problems, and on upstreaming the relevant patches.

Fatih, do you think you could have a look at the above problem?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
