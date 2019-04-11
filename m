From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:22:25 +0200
Subject: [Buildroot] [PATCH v3 2/2] Generating the .gitlab-ci.yml file
In-Reply-To: <20190411155805.4111-2-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
References: <20190411155805.4111-1-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
 <20190411155805.4111-2-yohar@P-ASN-FIRESTORM.daviel.idf.intranet>
Message-ID: <20190411182225.485fb7a5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Apr 2019 17:58:05 +0200
Youssef at smile.fr, Harmouch at smile.fr, youssef.harmouch at smile.fr wrote:

> From: youssef <youssef.harmouch@smile.fr>
> 
>   Signed-off-by: youssef <youssef.harmouch@smile.fr>

Thanks for your patch, but there are several problems with it:

 (1) It should be squashed into the patch introducing the test

 (2) The Signed-off-by line has some spurious spaces at the beginning

 (3) The From: and Signed-off-by should use your complete real name
     (i.e first name + last name)

I will fix this up myself when applying, so these are only
recommendations for future patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
