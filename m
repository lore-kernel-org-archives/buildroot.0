From: Thomas Lundquist <lists@zelow.no>
Date: Mon, 6 Nov 2006 10:50:31 +0100
Subject: [Buildroot] Suggestion, move TARGET_DIR
In-Reply-To: <014601c70176$4b3fa760$c94565d5@atmel.com>
References: <20061105120546.GB14530@zelow.no>
	<014601c70176$4b3fa760$c94565d5@atmel.com>
Message-ID: <20061106095031.GA9801@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 06, 2006 at 08:22:24AM +0100, Ulf Samuelsson wrote:
> 
> If you have, lets say, several ARM targets, it makes sense to have several "root"
> which you can rebuild without recompiling each package.

and both buld_<ARCH> and target_<ARCH> ends up as the same thing.

but if I understand you, you'd like target_<TARGET_NAME> or
target_<ARCH>_<TARGET_NAME> so we can build for more than one target?

> Also it would make sense to be able to generate binary rpm's for each package.

Landley mentioned dependencies but it shouldn't be that hard if we drop 
that headache.


Thomas.
