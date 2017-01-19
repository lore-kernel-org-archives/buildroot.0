From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jan 2017 16:30:29 +1100
Subject: [Buildroot] [PATCH] qt5base: use libinput if selected
In-Reply-To: <e9be1e34-cd1d-9a14-a99f-9c9829522b5f@grandegger.com>
References: <e9be1e34-cd1d-9a14-a99f-9c9829522b5f@grandegger.com>
Message-ID: <20170119163029.2716e590@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jan 2017 17:19:28 +0100, Wolfgang Grandegger wrote:
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks! I've applied to master, after doing the following changes:

    [Thomas:
     - move condition to a different place in the .mk file, with other
       similar conditions.
     - add an 'else' clause to pass -no-libinput in order to explicitly
       disable libinput support when the libinput package is not available.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
