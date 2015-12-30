From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 22:19:10 +0100
Subject: [Buildroot] [PATCH 0/4 v2] Do not select providers of virtual
	packages (branch yem/dont-select-providers)
In-Reply-To: <20151230221450.27edf444@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 30 Dec 2015 22:14:50 +0100")
References: <cover.1450391976.git.yann.morin.1998@free.fr>
 <20151218220532.515e1b50@free-electrons.com>
 <87poxnwtm3.fsf@dell.be.48ers.dk>
 <20151230221450.27edf444@free-electrons.com>
Message-ID: <87vb7fvdm9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> Dear Peter Korsgaard,
> On Wed, 30 Dec 2015 21:48:20 +0100, Peter Korsgaard wrote:

>> Should these lua suboptions perhaps now be enabled by default if lua is
>> available (E.G. default y)?

> To provide better "legacy" compatibility ?

No, just that the support code to provide lua support probably is quite
a bit smaller than lua / people are likely to want it if they have lua
enabled - So it perhaps makes sense to enable it by default.

You could also argue that we should handle it automatically without a
sub option like we do for openssl, but that would be a bigger change.

-- 
Venlig hilsen,
Peter Korsgaard 
