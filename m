From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:57:18 +0100
Subject: [Buildroot] [PATCH/next 14/31] package/kodi-pvr-*: mass version
 bump, add hashes
In-Reply-To: <1456006176-21308-15-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-15-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160302235718.153212a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:09:19 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-addon-xvdr/kodi-addon-xvdr.hash                          | 2 ++
>  package/kodi-addon-xvdr/kodi-addon-xvdr.mk                            | 4 ++--
>  package/kodi-pvr-argustv/kodi-pvr-argustv.hash                        | 2 ++
>  package/kodi-pvr-argustv/kodi-pvr-argustv.mk                          | 4 +++-
>  package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                        | 2 ++
>  package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                          | 4 +++-
>  package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash                    | 2 ++
>  package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                      | 4 +++-
>  package/kodi-pvr-filmon/kodi-pvr-filmon.hash                          | 2 ++
>  package/kodi-pvr-filmon/kodi-pvr-filmon.mk                            | 4 +++-
>  package/kodi-pvr-hts/kodi-pvr-hts.hash                                | 2 ++
>  package/kodi-pvr-hts/kodi-pvr-hts.mk                                  | 4 +++-
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash                  | 2 ++
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                    | 4 +++-
>  .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash  | 2 ++
>  .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk    | 4 +++-
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                          | 2 ++
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                            | 4 +++-
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                        | 2 ++
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                          | 4 +++-
>  package/kodi-pvr-njoy/kodi-pvr-njoy.hash                              | 2 ++
>  package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                | 4 +++-
>  package/kodi-pvr-pctv/kodi-pvr-pctv.hash                              | 2 ++
>  package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                | 4 +++-
>  package/kodi-pvr-stalker/kodi-pvr-stalker.hash                        | 2 ++
>  package/kodi-pvr-stalker/kodi-pvr-stalker.mk                          | 4 +++-
>  package/kodi-pvr-vbox/kodi-pvr-vbox.hash                              | 2 ++
>  package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                | 4 +++-
>  package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                      | 2 ++
>  package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                        | 4 +++-
>  package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                          | 2 ++
>  package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                            | 4 +++-
>  package/kodi-pvr-wmc/kodi-pvr-wmc.hash                                | 2 ++
>  package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                  | 4 +++-
>  34 files changed, 84 insertions(+), 18 deletions(-)
>  create mode 100644 package/kodi-addon-xvdr/kodi-addon-xvdr.hash
>  create mode 100644 package/kodi-pvr-argustv/kodi-pvr-argustv.hash
>  create mode 100644 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
>  create mode 100644 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
>  create mode 100644 package/kodi-pvr-filmon/kodi-pvr-filmon.hash
>  create mode 100644 package/kodi-pvr-hts/kodi-pvr-hts.hash
>  create mode 100644 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
>  create mode 100644 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
>  create mode 100644 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
>  create mode 100644 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
>  create mode 100644 package/kodi-pvr-njoy/kodi-pvr-njoy.hash
>  create mode 100644 package/kodi-pvr-pctv/kodi-pvr-pctv.hash
>  create mode 100644 package/kodi-pvr-stalker/kodi-pvr-stalker.hash
>  create mode 100644 package/kodi-pvr-vbox/kodi-pvr-vbox.hash
>  create mode 100644 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
>  create mode 100644 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
>  create mode 100644 package/kodi-pvr-wmc/kodi-pvr-wmc.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
