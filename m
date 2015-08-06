From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 6 Aug 2015 11:36:58 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-05
In-Reply-To: <20150806113014.163c6592@free-electrons.com>
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
Message-ID: <55C32ABA.90405@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 06/08/15 11:30, Thomas Petazzoni wrote:
>>          mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/1f4eee3423650651ac37f55dafed269c6d9baa98/
>
> MIPS problem:
>
>     fatal error: gnu/lib-names-o32_soft.h: No such file or directory
>
> Vicente, can you comment?

we are in conversations with Mentor to check the support for soft-float 
in their toolchains.

Regards,

Vincent.
