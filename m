From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Mar 2012 07:58:15 -0300
Subject: [Buildroot] [PATCHv3] libupnp: bump to version 1.6.15
In-Reply-To: <8739925j5z.fsf@macbook.be.48ers.dk>
References: <1332288749-27658-1-git-send-email-gustavo@zacarias.com.ar>
 <8739925j5z.fsf@macbook.be.48ers.dk>
Message-ID: <99478e127eaf59d9152dc979016cd48d@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-21 07:43, Peter Korsgaard wrote:

> Committed, thanks.

On a side note, the patch wasn't upstreamed because the IPv6 code 
changed quite a bit and they're doing things in a different way now.
Which will probably require A LOT of these kludges unless they test 
non-ipv6 and fix it before release.
Regards.
