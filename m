From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Tue, 11 Sep 2007 11:36:59 -0700
Subject: [Buildroot] Multiprojects
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1093F1305@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ulf,

I noticed that after I cleaned up my buildroot environment to remake
from scratch and after copying in a canned config file, the .config.cmd
file was missing and needed to be generated.

(Normally this happens when you run ...

  $ make menuconfig

...etc.

For what I was doing at the time, I copied my .config to config.old and
ran...

  $ make oldconfig

... to get the .config.cmd file generated and have my canned config file
take effect.

Now my question is whether or not additional logic will be needed with
the multiprojects patch in order to ensure that the contents of
.config.cmd are appropriately sync'd up with the ability to switch
config files when invoking the make command?   (Or does the file not
need to change so all would be OK then?)

The file appears to be related to auto.conf dependency on various
Config.in files.


Regards,

Darcy
