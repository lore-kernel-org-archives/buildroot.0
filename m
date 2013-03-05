From: Rob Landley <rob@landley.net>
Date: Tue, 05 Mar 2013 02:21:00 -0600
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130304192156.7bfe23bf@skate> (from
 thomas.petazzoni@free-electrons.com on Mon Mar  4 12:21:56 2013)
Message-ID: <1362471660.7276.2@driftwood>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/2013 12:21:56 PM, Thomas Petazzoni wrote:
> However, if an application relies on libudev to get notifications of
> devices appearing/disappearing, or other services, then of course, it
> cannot work with mdev.

Notifications are pretty straightforward. Should be possible for mdev  
to poke something simple and a shim library to provide the right  
interface...

Rob
