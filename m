From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:53:23 +0100
Subject: [Buildroot] [PATCH 3/3] vboot-utils: remove hash file
In-Reply-To: <56845669.3050005@mind.be>
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
 <20151230160016.14524b1f@free-electrons.com>
 <56844F79.3080903@mind.be>
 <20151230225333.171a6c4c@free-electrons.com>
 <56845669.3050005@mind.be>
Message-ID: <20151230235323.3f11d1ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 30 Dec 2015 23:10:49 +0100, Arnout Vandecappelle wrote:

>  IIRC the main reason why we didn't fully go for the "add hash files for all
> packages" approach was that we would need to add an empty hash file for about
> 300 packages. But then we discovered that github could have hash files, but we
> weren't entirely sure yet if that was really true.
> 
>  So I think now we can safely conclude that a hash file should be added for all
> packages, even if it just contains 'none' hashes. It is definitely an advantage
> to be able to distinguish packages that should still get a hash from packages of

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
