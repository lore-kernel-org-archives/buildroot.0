From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 19 Sep 2018 11:57:36 +0200
Subject: [Buildroot] [PATCH v2 0/2] at: bump version
In-Reply-To: <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
References: <20180918095726.50623f29@windsurf>
 <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
Message-ID: <00094f6c-cc7f-4534-9b92-c2775b1966ac@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've just opened a Merge Request upstream:
https://salsa.debian.org/debian/at/merge_requests/3

I invite everybody to place a "like" on Merge Request

Thanks
Kind regards

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

Il 18/09/2018 23:39, Giulio Benetti ha scritto:
> As suggested at https://elinux.org/Buildroot#Todo_list:
> "Update the at package to use the upstream.
> http://anonscm.debian.org/gitweb/?p=collab-maint/at.git;a=summary"
> In the meanwhile that site became unreachable and the at upstream now is:
> https://salsa.debian.org/debian/at
> 
> These are the basic tasks done:
> - change upstream site, bump version
> - add sha256 for legal-info files
> - improved S99at init.d script to have live session working
>    (/var/spool linked to /tmp) and warn about it
> 
> Giulio Benetti (2):
>    at: change upstream site, bump version
>    at: add sha256 for legal-info files
> 
>   package/at/S99at   |  9 +++++++++
>   package/at/at.hash |  7 +++++--
>   package/at/at.mk   | 10 ++++++----
>   3 files changed, 20 insertions(+), 6 deletions(-)
> 
