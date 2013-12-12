From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Dec 2013 08:32:01 +0100
Subject: [Buildroot] Knowing whether the target is multicore
In-Reply-To: <20131211053520.GD1217@tarshish>
References: <CA+-urNRh5WARfiTZXAiULdXmxTErbdJSGWTnRHjiTr_uEyEoeA@mail.gmail.com>
 <20131211053520.GD1217@tarshish>
Message-ID: <20131212083201.42f53a47@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 11 Dec 2013 07:35:20 +0200, Baruch Siach wrote:

> Whether a target is SMP or not depends on architecture and kernel 
> configuration, and that might be outside of Buildroot control when not 
> building the kernel internally. In my opinion, there should be a config option 
> allowing the user to select the SMP version or the UP one (or both).

I agree with Baruch: for now, we don't have many packages (if any other
than the one Frank is talking about) that need to know whether the
target will be UP or SMP. Therefore, I would suggest to have an Erlang
specific option to select this behavior.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
