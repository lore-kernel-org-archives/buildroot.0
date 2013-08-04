From: =?iso-8859-1?Q?Pl=FCss_Tobias_TA=2EE=2E1001?= <tobias.pluess@stud.hslu.ch>
Date: Sun, 4 Aug 2013 14:38:13 +0000
Subject: [Buildroot] Buildroot and NOMMU
Message-ID: <38F83949ED76A946BE17B6F2F98F362E0DA4F3@MX33.campus.intern>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to use Buildroot for my self made embedded system which uses an ARM7TDMI processor. It doesn't have an MMU. So my question is:

is it sufficient to disable MMU support in the

make menuconfig

of Buildroot, or do I have to do

make uclibc-menuconfig

and

make busybox-menuconfig

as well and disable MMU support in each of these? Or shall I left the uClibc and Busybox settings unchanged? Because I want only a very minimalistic system for my first tests.

Thanks in advance,

Tobias

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130804/76ab7371/attachment.html>
