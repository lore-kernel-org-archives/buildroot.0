From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Apr 2013 09:51:45 +0200
Subject: [Buildroot] [RFCv2] Per-package out-of-tree build
In-Reply-To: <14fa.516dd8b6.784b1@xionine.xdna.net>
References: <20130413205422.7eb87375@skate>
 <14fa.516dd8b6.784b1@xionine.xdna.net>
Message-ID: <20130417095145.05c519d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Cam Hutchison,

On Tue, 16 Apr 2013 23:03:18 -0000, Cam Hutchison wrote:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
> >      pkgconf: doesn't support out of tree build
> 
> Just a minor nit, but this description does not say what the patch does.

So something like:

pkgconf: mark as not supporting out of tree build

would be better?

Thanks for looking at the patches!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
