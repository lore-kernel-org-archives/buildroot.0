From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Jul 2014 15:19:51 -0300
Subject: [Buildroot] [PATCHv2] e2fsprogs: bump to version 1.42.11
In-Reply-To: <20140711200547.7bcb014d@free-electrons.com>
References: <1405096592-15847-1-git-send-email-gustavo@zacarias.com.ar>
 <20140711200547.7bcb014d@free-electrons.com>
Message-ID: <53C02AC7.9050500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/2014 03:05 PM, Thomas Petazzoni wrote:

> Applied, thanks. Next time, could you include in the commit log a
> description of why certain patches are kept and others are removed?

Sure, "they're upstream" ;)
The remaining patch is quite old from
44b5637ab28306dcd6f7a46aae56bdcf6284b3e7 (2009).
It might be worth checking if that's still required.
Regards.
