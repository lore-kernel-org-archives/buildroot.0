From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 16:43:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/softether: bump to version
 4.30-9700-beta
In-Reply-To: <CAPi7W81W2kJV3=v+OrobjENNyhBbwxV2NaoxnE95mp4HzFBCQw@mail.gmail.com>
References: <20191027095600.16937-1-fontaine.fabrice@gmail.com>
 <20191027114055.1195414d@windsurf.dhcp.lyon.intranet>
 <CAPi7W81W2kJV3=v+OrobjENNyhBbwxV2NaoxnE95mp4HzFBCQw@mail.gmail.com>
Message-ID: <20191027164305.568ae5b3@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 15:36:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Why is the first patch still there, since it is a patch from upstream ?
> > I would have expected it to go away ?  
> Nope, this patch is from SoftEtherVPN, it has not been backported to
> SoftEtherVPN_stable.

OK.

> > Note that I will apply Matt's patch that drops the "v" prefix, so if
> > you could rebase on that, it would be nice.  
> OK, done here: https://github.com/ffontaine/buildroot/commit/2b9579264b96d05a199960254d2016054014a74e

Thanks, I picked up this commit!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
