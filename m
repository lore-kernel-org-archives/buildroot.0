From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jan 2016 15:16:55 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer1: use a relative symlink to
 gstconfig.h
In-Reply-To: <CAHXCMMJPDbJCDFGoT958z+52j=zXjxy0ZUQFafvMr8u9YpuneQ@mail.gmail.com>
References: <1453987198-26052-1-git-send-email-phil@zankapfel.net>
 <871t91prte.fsf@dell.be.48ers.dk>
 <CAPiYbRKfZ6w-ih6A1EyZegvcU01uee9Wk=7uK8-bj7A88su9jQ@mail.gmail.com>
 <CAHXCMMJPDbJCDFGoT958z+52j=zXjxy0ZUQFafvMr8u9YpuneQ@mail.gmail.com>
Message-ID: <20160129151655.529f1cd1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,

On Fri, 29 Jan 2016 14:33:23 +0100, Samuel Martin wrote:

> I'm working on making the SDK (host dir. and staging dir.) relocatable.
> You can check the current state of my branch [1].
> I hope to submit a first step before the 2016.02 RC month, but this is
> not yet ready :-/
> 
> Anyway, I'm really interested in gathering all that have to be done
> for the relocatable SDK. ;-)

Glad to hear you are working on making the SDK relocatable !

However, if I may have a suggestion, I believe you shouldn't submit all
the changes needed in one big patch series.

Instead, what I would suggest is that you:

 1/ Write up a web-page or Wiki-page with a list of things that need to
    be fixed.

 2/ Send one patch series for each thing that needs to be fixed. And
    maybe not send all patch series at the same time: handle one or two
    topics at a time.

 3/ Keep your Wiki page updated with the things that have been merged,
    and things that remain to be merged, that remain to be submitted,
    etc.

Moving to a relocatable SDK is a big change that requires lots of
smaller changes. We have to handle it progressively, otherwise it will
never be merged due to the amount of required changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
