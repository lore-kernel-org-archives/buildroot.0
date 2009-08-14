From: Cristi Magherusan <Cristi.Magherusan@net.utcluj.ro>
Date: Fri, 14 Aug 2009 11:33:29 +0300
Subject: [Buildroot] Using Buildroot to make small footprint linux
In-Reply-To: <BAY136-W6773916E1BA7831DE5443CE0E0@phx.gbl>
References: <BAY136-W6773916E1BA7831DE5443CE0E0@phx.gbl>
Message-ID: <1250238809.2595.7.camel@ufo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2009-08-02 at 17:51 +0100, Raed Abu-Sanad wrote:
> Hi,,
> 
> I just downloaded latest version buildroot. I am working on ubuntu
> 8.04.
> how can i started the automated process of buildroot to create
> filesytem and kernel images and install them on a USB flas or CF ?
> Any simple tutorial?
> 
> Thanks

Hello,

It should feel very familiar to the people who at least once have
compiled a Linux kernel.. 

Run "make menuconfig" in the root dir, select whatever you need to, then
run "make", and it will generate whichever you ask it to from the menu
interface.

It can generate everything as a Ext3 FS image(other rootfs formats may
be useful too), which you can just dd to your disk and grow it using
gparted until it fills it..

Here's the whole documentation, if you won't be satisfied with the two
commands I wrote before: http://buildroot.uclibc.org/buildroot.html

Cristi

-- 
Ing. Cristi M?gheru?an, System/Network Engineer
Technical University of Cluj-Napoca, Romania
http://cc.utcluj.ro  +40264 401247
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 197 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090814/520b0b01/attachment.pgp>
