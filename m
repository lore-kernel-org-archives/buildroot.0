From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Mar 2014 15:33:37 -0300
Subject: [Buildroot] [PATCH v2] glibc: needs MMU
In-Reply-To: <1393871487-2739-1-git-send-email-yann.morin.1998@free.fr>
References: <1393871487-2739-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5314CB01.40607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2014 03:31 PM, Yann E. MORIN wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Like eglibc, glibc is only available to MMU-based architectures.
> 
> Re-order select/depends to be in-line with eglibc, just above.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
