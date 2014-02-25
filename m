From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Feb 2014 19:14:28 +0100
Subject: [Buildroot] Analysis of VLC build failures
In-Reply-To: <530C4314.4000203@mind.be>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate> <530C4314.4000203@mind.be>
Message-ID: <20140225191428.6da48255@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 25 Feb 2014 08:15:32 +0100, Arnout Vandecappelle wrote:

>  My feeling is that vlc is currently not in a state that we can release
> it. I have no issue with including some package that doesn't work very
> well in a release, but for a flagship package like vlc I think it's
> important that we really get it right. And currently we don't.

That's fine with me, mark it as "depends on BR2_BROKEN" for example.
Add a big fat comment above it that details all the reasons you listed
in your e-mail, so that the next people interested in vlc will find out
precisely why it's marked as broken.

What however annoys me is that we don't have a clear adopter/maintainer
for this package. Simon said he initially did the work, but that he is
no longer interested in the package. So what I fear is that the package
may remain in a broken state for quite a while.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
