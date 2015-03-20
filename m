From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Mar 2015 20:00:57 -0300
Subject: [Buildroot] [PATCH] glibc: disable eglibc 2.18 for sparc
In-Reply-To: <20150320221033.13c88518@free-electrons.com>
References: <1426630860-2813-1-git-send-email-gustavo@zacarias.com.ar>	<20150320215022.7df3b2f1@free-electrons.com>	<550C8979.9030803@zacarias.com.ar>
 <20150320221033.13c88518@free-electrons.com>
Message-ID: <550CA6A9.6070409@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/2015 06:10 PM, Thomas Petazzoni wrote:

> Well if nobody cares about powerpc SPE in upstream glibc, using uClibc
> will be the only solution.

From what i've read there was a effort to get soft-fp going for that
which makes sense because E500v1 is only single-precision and E500v2 is
double, to make them ABI compatible.
I'll dig and get back on it since keeping eglibc around might not be a
good idea long-term.
Regards.
