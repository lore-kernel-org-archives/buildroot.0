From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jul 2012 08:31:27 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <50117274.6030703@mind.be>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
 <20120725203109.5d295941@skate> <20120725211514.1ee35d6a@skate>
 <50117274.6030703@mind.be>
Message-ID: <20120727083127.1ad79932@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Jul 2012 18:38:12 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   I haven't tested it, but looks good at first sight.
> 
>   That said, you still agree with a separate BR2_mips and BR2_mips64, right?

Yes: just like x86/x86-64. Separate architecture options, but a single
"Target Architecture Variant" choice, with the relevant "if" conditions
to show/hide the right processors depending on whether they are 64 bits
capable or not.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
