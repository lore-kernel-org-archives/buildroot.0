From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 19 Jun 2018 15:56:40 -0300 (BRT)
Subject: [Buildroot] Is there a target to build all packages?
Message-ID: <1551839091.1605535.1529434600938.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using a custom target in external.mk to build all packages without
running the remaining steps defined in target-finalize:

    .PHONY: target-packages
    target-packages: $(PACKAGES)

I wonder if such a target is really necessary or the same result could
be achieved by means of some existing (albeit obscure) target.

Thoughts?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000
casantos at datacom.com.br          +55 51 3933.3000 ext. 3627
http://www.datacom.com.br
