From: Christian Stewart <christian@paral.in>
Date: Mon, 08 Apr 2019 00:06:47 -0700
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <20190408090251.7a63fd0d@windsurf>
References: <20190317012142.10545-1-christian@paral.in>
 <20190407221726.130ca0fe@windsurf> <87mul1fe27.fsf@paral.in>
 <20190408090251.7a63fd0d@windsurf>
Message-ID: <87bm1hf01k.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> OK, thanks! What is the specific situation of the three Go packages
> that Fabio wanted to integrate, namely bitcoin, btcd and neutrino ?
> Will they be readily usable with the Go module integration ?

Both of these projects already seem to be using go.mod:

 - https://github.com/btcsuite/btcd
 - https://github.com/lightninglabs/neutrino

... I can submit PoC patches implementing them trivially with the go
module PoC patch in place.

Best regards,
Christian
