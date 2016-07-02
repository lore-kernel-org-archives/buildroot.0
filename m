From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 12:33:05 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <77293ee3-6e4c-7342-214d-adffdde679f8@mind.be>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <77293ee3-6e4c-7342-214d-adffdde679f8@mind.be>
Message-ID: <20160702123305.6bfbbc81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Jul 2016 12:18:30 +0200, Arnout Vandecappelle wrote:

>  That automatic derivation of dependencies of host packages sounded like a good
> idea at the time, but it can really bite you. Of the 200 host packages that we
> have at the moment, there are just 64 that use the inheritance - and many of
> them are in Julien's list here (possibly incorrectly).
> 
>  So, as the person who introduced this mis-feature, I'm the first one to vote
> for removing it again.

I agree that this automatic derivation has caused quite a few issues in
the past and in many cases, we need different dependencies for the host
and the target variants. So maybe we should think of removing this
functionality.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
