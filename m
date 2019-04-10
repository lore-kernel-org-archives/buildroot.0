From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 10 Apr 2019 12:06:13 +0200
Subject: [Buildroot] [PATCH] package/civetweb: fix link failure due to
 missing OpenSSL dependency
In-Reply-To: <20190409232825.2cdb0766@windsurf.home>
References: <20190409211032.66320-1-giulio.benetti@micronovasrl.com>
 <20190409232825.2cdb0766@windsurf.home>
Message-ID: <b2773d1e-64c4-bc13-a9a9-1bd76c686f28@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 09/04/2019 23:28, Thomas Petazzoni ha scritto:> $(HOST_DIR)/usr no 
longer really exists, it's a symlink to $(HOST_DIR),
> so this path should have been just $(HOST_DIR)/bin/pkg-config.
> 
> However, pkgconf.mk precisely provides the PKG_CONFIG_HOST_BINARY
> variable, which contains exactly the path to pkg-config. So I've used
> that instead.

Ah I've missed that variable good to know.

Thank you
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
