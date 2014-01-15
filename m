From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jan 2014 21:08:02 -0300
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
Message-ID: <52D5D162.7020203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2014 08:44 PM, Yann E. MORIN wrote:

> The choosen hash function is SHA1 since it is widely available, though
> theoretical attacks have been devised (but no known practical attack is
> known).

Hi.
Normally you want whichever upstream uses for their announcement, you
shouldn't hardcode the method and you definitely shouldn't compute when
you download.
That's because you may bump some time later after compromise and if you
compute it when bumping then you're just giving your word on a maybe
compromised one.
Just my $.02
Regards.
