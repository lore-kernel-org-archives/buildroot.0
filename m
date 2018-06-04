From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 23:46:27 +0200
Subject: [Buildroot] [PATCH 1/2] host-perl-autodie: new package
In-Reply-To: <CAPi7W83DNMjUBWrXYbfy_bdz0FaT_yR_i+Ym1zD8Chckfm4ZWg@mail.gmail.com>
References: <20180603081134.1933-1-fontaine.fabrice@gmail.com>
 <20180604230457.13d4e185@windsurf>
 <CAPi7W83DNMjUBWrXYbfy_bdz0FaT_yR_i+Ym1zD8Chckfm4ZWg@mail.gmail.com>
Message-ID: <20180604234627.2b7ba981@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jun 2018 23:34:34 +0200, Fabrice Fontaine wrote:

> Second or third solution are definitely better than first one. Which one do
> yo prefer?
> Perhaps, the second option is better, I don't know if all our users run the
> dependencies.sh script?

dependencies.sh is run by Buildroot at the beginning of every build,
and if it fails to find a required dependency, the build doesn't even
start.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
