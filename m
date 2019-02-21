From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Feb 2019 08:57:54 +0100
Subject: [Buildroot] [PATCH 2/2] package/rabbitmq-c: needs dynamic
 library
In-Reply-To: <d320bfd8-9b10-6916-a8c9-bb211ae7a8f5@mind.be>
References: <20190218114434.10741-1-fontaine.fabrice@gmail.com>
 <20190218114434.10741-2-fontaine.fabrice@gmail.com>
 <d320bfd8-9b10-6916-a8c9-bb211ae7a8f5@mind.be>
Message-ID: <20190221085754.1f585877@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Feb 2019 23:39:59 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Note that this patch essentially reverts Thomas' attempt to fix static build in
> beb6524225f, almost two years ago. I expect Thomas was just fixing autobuild
> results and doesn't actually need a statically linked rabbitmq.

I can confirm that I don't care about rabbitmq static linking support.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
