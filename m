From: Bernhard Fischer <rep.nop@aon.at>
Date: Sat, 25 Nov 2006 12:24:38 +0100
Subject: [Buildroot] Stunnel package added
In-Reply-To: <1164346255.18338.5.camel@localhost.localdomain>
References: <1164346255.18338.5.camel@localhost.localdomain>
Message-ID: <20061125112433.GA27344@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 24, 2006 at 01:30:54PM +0800, Crispin Wellington wrote:
>Greetings,
>
>I have added stunnel as a supported package to the buildroot system.

Merged. A few comments, though:

1) Please don't use zcat or bzcat directly but
STUNNEL_CAT:=$(ZCAT)
(done.)

2) We don't require autoconf nor automake (IIRC), so this must be
removed. (done.)

3) Why do you put stunnel into target_utils ?

thanks,
