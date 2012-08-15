From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 16:56:02 +0200
Subject: [Buildroot] libev on armv5 - illegal instruction
In-Reply-To: <op.wi21qq1byxxkfz@pohanka-pc>
References: <op.wirpbfhyyxxkfz@pohanka-pc> <20120810085836.3c62fe7e@skate>
 <op.witduljwyxxkfz@pohanka-pc> <20120810215623.5d7304a5@skate>
 <op.wi21qq1byxxkfz@pohanka-pc>
Message-ID: <20120815165602.769aad1f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Aug 2012 14:45:52 +0200,
"Jan Pohanka" <xhpohanka@gmail.com> a ?crit :

> have you found the example I posted useful to extract some information,  
> please? I would like to solve that issue.

You have ccache enabled. Can you try doing a build with ccache
disabled, and see if it generates a working libev?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
