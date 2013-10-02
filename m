From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 2 Oct 2013 13:49:57 -0500
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
Message-ID: <OF28FCBE52.CC9DE764-ON86257BF8.00513AFD-86257BF8.006773C0@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 
10/02/2013 09:06:13 AM:

[...]

> 5. the manifest also lists all host packages, like automake, autoconf,
> ... while these are not distributed on target. Strictly speaking you
> do not have to list these in the customer documentation of a product,
> in my interpretation. I find it confusing that both target and host
> packages are mixed like that.
> Of course, it's probably difficult to change this, because some
> packages can be built for host _and_ target, and the legal-info
> infrastructure does not know which of these was used for a particular
> project.

One other thing that I would like to add about the legal-info that I
would like to see added is the manifest.csv file contain the 
URL from which the source packages originated from. Is this something
that people be interested in seeing added? As part of our release 
process, we need to show where the original source file came from (URL).

Thanks,
-Ryan

------------------------------------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
rjbarnet at rockwellcollins.com
www.rockwellcollins.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131002/a45d223b/attachment.html>
