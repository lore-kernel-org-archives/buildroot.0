From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 21:14:14 +0100
Subject: [Buildroot] [PATCH] toolchain: disable internal for blackfin
In-Reply-To: <55085D2D.9010501@zacarias.com.ar>
References: <1426610460-11691-1-git-send-email-gustavo@zacarias.com.ar>
 <20150317175630.6eeb2043@free-electrons.com>
 <55085D2D.9010501@zacarias.com.ar>
Message-ID: <20150317211414.0b856147@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Mar 2015 13:58:21 -0300, Gustavo Zacarias wrote:

> > Maybe some follow-up patches are possible, in binutils/Config.in.host
> > and gcc/Config.in.host in the selection of versions?
> 
> Do we want to completely remove traces about it?

Well to be honest, seeing how little contributions the Blackfin people
are doing to upstream projects, I am not really hoping a radical
improvement in the upstream support for Blackfin in the coming months
(years?). So I'd prefer to remove the traces of Blackfin support.

Another option of course, would be to introduce support for the ADI
specific gcc and binutils versions at
http://sourceforge.net/p/adi-toolchain/blackfin/ci/master/tree/. But
it's one Git repository with everything, so not easy to package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
