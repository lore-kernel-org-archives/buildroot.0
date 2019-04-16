From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 16 Apr 2019 12:24:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-04-15
In-Reply-To: <20190416060047.6838786EF6@hemlock.osuosl.org>
References: <20190416060047.6838786EF6@hemlock.osuosl.org>
Message-ID: <e6975dfa-1a60-c394-de64-2e11243181d2@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 16/04/2019 08:00, Thomas Petazzoni ha scritto:
> Hello,
> 
> Build statistics for 2019-04-15
> ===============================
> 
>        branch |  OK | NOK | TIM | TOT |
>     2019.02.x |  25 |   0 |   0 |  25 |
>        master | 167 |  50 |   0 | 217 |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                  host-go-1.12.1 | 6
>                 madplay-0.15.2b | 6
>                      git-2.16.5 | 5
>                host-clang-8.0.0 | 5
>                ghostscript-9.27 | 2
> libcamera-d5ca33f6c7b0cd1ca... | 2
>                qt5enginio-1.6.3 | 2
>                 wireshark-2.6.7 | 2
>                    brotli-1.0.7 | 1
>                     clang-8.0.0 | 1
>                  cracklib-2.9.7 | 1
>                    davfs2-1.5.4 | 1
>                      efl-1.22.0 | 1
>                freeswitch-1.8.5 | 1
>                 host-efl-1.22.0 | 1
>                    libssh-0.8.7 | 1
>                     mimic-1.1.0 | 1
> minicom-19ab49422f3431102c3... | 1
>                     netsurf-3.8 | 1
>                   python3-3.7.3 | 1
>                  qt5base-5.12.2 | 1
>                   qt5base-5.6.3 | 1
>                 qt5webkit-5.9.1 | 1
>                swupdate-2018.11 | 1
>             uboot-tools-2019.01 | 1
>    vdr-plugin-vnsiserver-v1.8.0 | 1

This ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ is fixed by:
https://patchwork.ozlabs.org/patch/1085284/

Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
