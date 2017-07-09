From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 18:30:15 +0200
Subject: [Buildroot] [PATCH 1/2] pcre2: new package, required by Qt 5.9
In-Reply-To: <361f50e8-a49c-2e88-8375-89b2ff56212c@mind.be>
References: <DM5PR03MB2924501FB63A9FEA79548F57BFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
 <361f50e8-a49c-2e88-8375-89b2ff56212c@mind.be>
Message-ID: <20170709183015.615b4e1e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Jul 2017 22:58:03 +0200, Arnout Vandecappelle wrote:

>  So everything is OK except for the authorship, the reference to the signature
> and the fact that the patch is broken. With those things fixed you can add my:
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

One thing you forgot is the entry to the DEVELOPERS file.

Also, another thing I'm noticing now is that a host variant of pcre2
was added, and I don't see it used anywhere in the Qt 5.9 bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
