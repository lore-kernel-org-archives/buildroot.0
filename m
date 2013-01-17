From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jan 2013 13:55:05 +0100
Subject: [Buildroot] Udev generates too many tty dev nodes
In-Reply-To: <CAKvQZ_2FEFO7BNqkzXTCeH5+scxg6ZhuW+Ruy99Q8xxivjhx_w@mail.gmail.com>
References: <CAKvQZ_2FEFO7BNqkzXTCeH5+scxg6ZhuW+Ruy99Q8xxivjhx_w@mail.gmail.com>
Message-ID: <20130117135505.56db811a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Thu, 17 Jan 2013 01:48:41 +0100, Willy Lambert wrote:

> I'm trying to put my /dev folder into order, and I recently switched
> from static config to udev. All device are correctly set up exept tty*
> that are umerously present (something like 64 nodes).
> 
> _ Does anyone know if it is normal that so many files are generated ?
> (or said differently should I wonder about my buildroot outputs)
> _ Is there any mean to change that ?
> _ Is this only and udev problem or is it linked to buildroot
> integration ?

Is it really an issue? I mean, device nodes really don't consume that
much memory or anything, so, who cares?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
