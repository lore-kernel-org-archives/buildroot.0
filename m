From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 10 Jun 2014 13:34:01 +0200
Subject: [Buildroot] Some files to be copied to root file systems such
 as openvpn keys, conf
In-Reply-To: <20140610122310.0c3caa20@free-electrons.com>
References: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
 <CAHXCMMJsvZUPqtFwtKC=ZgSiNmwJ0A3_MYn=Fn0hbgi9iiz8Zg@mail.gmail.com>
 <CAMm5YqotyZ9y6c3vFXME+rh860RiB1X0RUFE=10k40yrzbM+fg@mail.gmail.com>
 <CAMm5YqpZ1dV02==G=ZHEc3NUFD5UHGrUq7yTEzLQODQh1YfetQ@mail.gmail.com>
 <CAHXCMM+8D+waazrj2S6sU=T5y=3JjGD6A_=veV-zk548_uO-Dg@mail.gmail.com>
 <20140610122310.0c3caa20@free-electrons.com>
Message-ID: <CAHXCMMJWWjehS=W8ALLCTNaexL8OMJWCyd-Z56TnqxCCcDMPfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 10, 2014 at 12:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Tue, 10 Jun 2014 12:06:44 +0200, Samuel Martin wrote:
>
>> AFAIK, there is no way to set permissions on files outside a package's
>> *.mk files :-(
>
> Huh? I guess you should have a look at the BR2_ROOTFS_DEVICE_TABLE
> option then. It is precisely meant to allow that: set file permissions.

Arf! I forgot about this one ;-)

-- 
Samuel
