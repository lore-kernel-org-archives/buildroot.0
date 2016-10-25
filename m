From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:15:04 +0200
Subject: [Buildroot] [PATCH 1/7] toolchain-wrapper: pass MIPS
 optimizations to TOOLCHAIN_WRAPPER_OPTS
In-Reply-To: <4f2ec66a-0587-2e27-6f6b-317f16e20c8e@mind.be>
References: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
 <4f2ec66a-0587-2e27-6f6b-317f16e20c8e@mind.be>
Message-ID: <20161025231504.72e63678@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 20:59:08 +0200, Arnout Vandecappelle wrote:

>  This is not exactly what I meant, so I've sent a quick patch that does do what
> I meant. Wait a little for Thomas to provide feedback on it, and then you can
> include it in your series. For now I've marked the series as Superseded and
> Changes Requested.

Only patches 1/7 and 2/7 were marked as Changes Requested or
Superseded, but patches 3/7 to 7/7 were still in patchwork. So I've
also marked them as Changes Requested, as they need to be resent with
the rest.

Vicente: for the next iteration, you can merge patches 3/7 to 7/7 in a
single patch, like:

  mips: indicate which MIPS cores have MSA support

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
