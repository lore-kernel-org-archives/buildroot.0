From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:57:45 +0100
Subject: [Buildroot] [PATCH v3] luarocks addon
In-Reply-To: <20181219081707.1983-1-francois.perrad@gadz.org>
References: <20181219081707.1983-1-francois.perrad@gadz.org>
Message-ID: <20181231175745.35c7ac37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Dec 2018 09:17:02 +0100, Francois Perrad wrote:

> Francois Perrad (5):
>   luarocks: add buildroot addon
>   lua*: regeneration of *.mk files
>   lua*: regeneration of Config.in
>   lua*: regeneration of hash files
>   pkg-luarocks: add per package upgrade target

I have applied this series, after improving a bit the commit titles and
commit logs and the wording of the change in the Buildroot manual.

Also, in the regeneration of the Config.in files, there were two lines
that got removed that I found should be kept, I'll reply to that patch
specifically.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
