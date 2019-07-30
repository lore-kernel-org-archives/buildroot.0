From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 30 Jul 2019 20:16:24 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d27_som1: bump to
 linux4sam_6.1
In-Reply-To: <20190730142142.7ed8ec91@windsurf>
References: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
 <20190726162711.2c4ede9a@windsurf>
 <2915f499-4364-e4c7-9c19-b45892568565@koncepto.io>
 <20190730142142.7ed8ec91@windsurf>
Message-ID: <f70db92b-d1c1-c617-ac54-87400f011435@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 30/07/2019 ? 14:21, Thomas Petazzoni a ?crit?:
> If you have the OpenSSL development package installed on your system,
> then indeed you don't see the problem. However, the defconfigs are
> tested in a Docker container, with just the minimal dependencies needed
> by Buildroot to run, and these dependencies do not include OpenSSL
> development files. This explains why you have not seen the issue.

Indeed, thanks for the clarifications.

Regards,

Pierre-Jean

> 
> Best regards,
> 
> Thomas
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
