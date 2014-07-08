From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Jul 2014 19:26:39 -0300
Subject: [Buildroot] [PATCH 13/13] dmraid: add license information
In-Reply-To: <87a98jv6ae.fsf@dell.be.48ers.dk>
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>	<1404304811-27480-13-git-send-email-gustavo@zacarias.com.ar>
 <87a98jv6ae.fsf@dell.be.48ers.dk>
Message-ID: <53BC701F.9070707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/08/2014 07:23 PM, Peter Korsgaard wrote:

> I actually don't see any LGPL references in the sources - And looking at
> other distributions, they have also classified it as GPLv2+, so I've
> dropped the LGPL part and instead added 'LICENSE' to _LICENSE_FILES.
> 
> Committed with those changes, thanks.

I tried to err on the safe side on this one since it's mentioned in
LICENSE and the LGPL COPYING is shipped as well.
There's probably an exception somewhere when linking to the libs,
however we don't use it that way so just GPL is probably fine.
Regards.
