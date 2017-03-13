From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 13 Mar 2017 08:45:06 +0100
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2017.03-eng008
In-Reply-To: <1488545241-17332-1-git-send-email-vzakhar@synopsys.com>
References: <1488545241-17332-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <1489391106.30445.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2017-03-03 at 15:47 +0300, Vlad Zakharov wrote:
> This commit bumps ARC toolchain to arc-2017.03-eng008.
> 
> Please note that it is an engineering build and it might have all
> kinds
> of breakages, please don't use it for production builds.

we had to disable some packages for ARC because of toolchain issues.
Maybe we shall reenable them?

J?rg
