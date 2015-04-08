From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 08 Apr 2015 14:30:51 -0300
Subject: [Buildroot] [PATCH v2 1/5] gcc-final: install libatomic
In-Reply-To: <20150408192924.0520195b@free-electrons.com>
References: <1428511969-28430-1-git-send-email-gustavo@zacarias.com.ar>	<1428511969-28430-2-git-send-email-gustavo@zacarias.com.ar>	<20150408191414.1fce04ac@free-electrons.com>	<552564A8.4050406@zacarias.com.ar>
 <20150408192924.0520195b@free-electrons.com>
Message-ID: <552565CB.8030607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2015 02:29 PM, Thomas Petazzoni wrote:

> Is libatomic going to be provided by all toolchains on all
> architectures?

It doesn't matter, if the file isn't available it won't error out
(tested on blackfin external toolchain).
Regards.
