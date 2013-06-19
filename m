From: jerryalex at tx.rr.com <jerryalex@tx.rr.com>
Date: Wed, 19 Jun 2013 11:26:41 -0400
Subject: [Buildroot] buildroot and kernel modules
Message-ID: <20130619152641.5DF95.59510.root@cdptpa-web08-z02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

looking into how to enter sysbuild rules to automatically have my kernel modules loaded on bootup.

Standard linux uses depmod to enter modules into modules.dep so that they are automatically loaded on bootup.
Right now our NFS file system does not have the depmod command and it appears that editing 
modules.dep by hand and adding entries does not work.

Does buildroot have their own rules to load modules or does it use depmod.
I did not find any instructions in the buildroot user manual addressing the above.

                                                          Thanks,
                                                                  jerry
