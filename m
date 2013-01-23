From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jan 2013 16:53:05 +0100
Subject: [Buildroot] [PATCH] pkg-infra: add documentation for
 <pkg>_CONFIG_FIXUP variable
In-Reply-To: <50FFE359.9070004@petroprogram.com>
References: <1358773906-30653-1-git-send-email-stefan.froberg@petroprogram.com>
 <CAHXCMML5m19SwE=E4cOUKWWtMk0qYWjdUV49Vx_yuN895tawmw@mail.gmail.com>
 <50FFE359.9070004@petroprogram.com>
Message-ID: <20130123165305.6a659da1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Wed, 23 Jan 2013 15:19:21 +0200, Stefan Fr?berg wrote:

> >> +The problem is that all these *-config files by default give
> >> wrong,
> > s/,$//
> 
> No $ ? Ok.

No, he meant "no comma at the end of line". $ is the sign in a regexp
that matches the end of the line. So s/,$// means: replace the comma at
the end of the line by nothing.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
