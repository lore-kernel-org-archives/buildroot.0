From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 23:39:49 +0200
Subject: [Buildroot] [PATCH v2 2/5] package/protobuf: add a patch for
 mips big endian
In-Reply-To: <F89F5134-B038-4D91-93FF-C3AE7250477F@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-3-charles.hardin@storagecraft.com>
 <20180628223441.43372ad7@windsurf>
 <F89F5134-B038-4D91-93FF-C3AE7250477F@storagecraft.com>
Message-ID: <20180628233949.2c8359ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jun 2018 21:36:25 +0000, Charles Hardin wrote:

> > I've applied to master. However your pull request to the upstream
> > protobuf project has been closed, because you did not sign the CLA:
> > https://github.com/google/protobuf/pull/4657. Could you follow that
> > process to make sure your patch gets merged upstream ?
> 
> Looks like email confusion - reposted and it should be able to go thru.

I don't see any e-mail confusion. There is a clear comment in the pull
request indicating that you need to sign the CLA.

Or perhaps you mean that you have already signed this CLA, and just
because your patch had the wrong author e-mail, the Github bot didn't
recognize you as a person who has signed the CLA ?

> It is unclear if there is any intention on protobuf to support mips big endian
> anyway.

Why wouldn't they ? It's just a trivial one line patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
