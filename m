From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 10:26:46 +0100
Subject: [Buildroot] btrfs filesystem image as subvolume
In-Reply-To: <BL0PR0102MB3412448238EBCFA54C15B849F39F0@BL0PR0102MB3412.prod.exchangelabs.com>
 (Francois Gervais's message of "Mon, 21 Jan 2019 20:57:55 +0000")
References: <BL0PR0102MB3412448238EBCFA54C15B849F39F0@BL0PR0102MB3412.prod.exchangelabs.com>
Message-ID: <878szbn2qx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gervais," == Gervais, Francois <FGervais@distech-controls.com> writes:

Hi,

 > Hi,
 > I tried the btrfs filesystem image and it works fine however in my
 > use-case I'd like to have only the subvolume and not the whole btrfs
 > filesystem.

 > Basically the output of "btrfs send".

 > I'd first like to make sure this is not possible today and discuss some
 > high level guidelines you would like me to follow when I implement
 > the feature.

 > Should I add a sub-option to the "btrfs root filesystem" menu?
 > Should if have it's own "Filesystem images" entry?

Adding Robert who contributed the btrfs support. Robert, any feedback on
this?

-- 
Bye, Peter Korsgaard
