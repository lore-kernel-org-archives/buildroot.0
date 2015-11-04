From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Wed, 4 Nov 2015 16:06:49 +0530
Subject: [Buildroot] buildroot configuration files -- query
Message-ID: <CAKpDV8sD-00LdpoqPS_pgbPGkqdn5bm2HX_JBGCgKHdq39sdvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildroot Team,

I am referring following document to learn buildroot.
http://buildroot.uclibc.org/downloads/manual/manual.html

1> What exactly is the difference between the configuration files in*
/board* directory & */configs* directory ?

   For example these two config files are for at91sam9260ek MCU :--
   /board/atmel/at91sam9260ek/linux-3.9.config
   /configs/at91sam9260eknf_defconfig

   What i got is configuration file in /configs directory is for a
particular MCU & configuration file in /board directory is for board based
on particular MCU.
   Have i got it right ?



2> we can load the configuration using following command :--
  * make <name>_defconfig command*

   we can save a configuration by following command *make savedefconfig*.
As said in following section :--
   9.3. Storing the Buildroot configuration
   The Buildroot configuration can be stored using the command make
savedefconfig.
   The recommended place to store this defconfig is
configs/<boardname>_defconfig.

   a> Now my question how the configuration file for new MCU is created
first time in /configs directory. What is the command to use for this ?
   b> How the configuration file for a particular board is created first
time & saved (lets say for example this /board/atmel/XXXX)
      Now how to create & save configuration file for XXXX board ? What is
command to use for this ?

Please suggest.

Regards,
Dinesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151104/9be84a8a/attachment.html>
