From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2011 22:26:04 +0200
Subject: [Buildroot] mounting a cramfs
In-Reply-To: <4DA5D4E5.7020603@michaelburghart.de>
References: <4DA5D4E5.7020603@michaelburghart.de>
Message-ID: <20110419222604.5b58e547@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

I'm not sure this is really Buildroot-related, but anyway.

On Wed, 13 Apr 2011 18:52:53 +0200
Michael Burghart <mb@michaelburghart.de> wrote:

> mount /etc/language /var/language or explicitly with:

Are you sure that /etc/language is really a cramfs image ? It sounds
like a very strange location and name for a cramfs image.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
