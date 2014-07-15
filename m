From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Jul 2014 20:48:28 -0300
Subject: [Buildroot] [PATCH 5/5 v2] package/parted: gettextize to match
 the new gettext version
In-Reply-To: <2cf9afdee12730d0d550b2847f620e8011b6852e.1405463657.git.yann.morin.1998@free.fr>
References: <cover.1405463657.git.yann.morin.1998@free.fr>
 <2cf9afdee12730d0d550b2847f620e8011b6852e.1405463657.git.yann.morin.1998@free.fr>
Message-ID: <53C5BDCC.9090002@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/2014 07:37 PM, Yann E. MORIN wrote:

> The gettext macros in the package are from a gettext version older than
> the one we have in Buildroot, so autoreconf fails.
> 
> Run gettextize prior to running autoreconf, like we do in wget.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/ee2/ee20455ead785200847f50e463c32c55821f8925/
>     http://autobuild.buildroot.net/results/3fe/3fe46e1a6ef10645e46a2e9efdf651f60f05dea8/
>     http://autobuild.buildroot.net/results/ecd/ecdacafb3245afa1cce4f587eff9bdfe5c162f81/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
