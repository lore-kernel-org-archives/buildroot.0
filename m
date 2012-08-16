From: Jan Pohanka <xhpohanka@gmail.com>
Date: Thu, 16 Aug 2012 10:49:40 +0200
Subject: [Buildroot] libev on armv5 - illegal instruction
In-Reply-To: <20120815165602.769aad1f@skate>
References: <op.wirpbfhyyxxkfz@pohanka-pc> <20120810085836.3c62fe7e@skate>
 <op.witduljwyxxkfz@pohanka-pc> <20120810215623.5d7304a5@skate>
 <op.wi21qq1byxxkfz@pohanka-pc> <20120815165602.769aad1f@skate>
Message-ID: <op.wi4lg2b2yxxkfz@pohanka-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> You have ccache enabled. Can you try doing a build with ccache
> disabled, and see if it generates a working libev?

Thank you for pointing this out. I didn't realized what ccache do and  
there was probably cached some version with wrong CFLAGS.

best regards
Jan

-- 
Tato zpr?va byla vytvo?ena p?evratn?m po?tovn?m klientem Opery:  
http://www.opera.com/mail/
