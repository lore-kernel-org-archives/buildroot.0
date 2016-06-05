From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 5 Jun 2016 15:31:48 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump to latest version
In-Reply-To: <57541C1F.8090703@zacarias.com.ar>
References: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
 <20160604221423.GC6825@waldemar-brodkorb.de>
 <57541C1F.8090703@zacarias.com.ar>
Message-ID: <20160605133148.GH6825@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Gustavo Zacarias wrote,

> On 04/06/16 19:14, Waldemar Brodkorb wrote:
> 
> >I have no issues with ethernet in 4.6.1 when using ml605 instead
> >of lx60 (tested with Qemu 2.6.0). Should we switch?
> >
> >best regards
> >  Waldemar
> 
> Hi.
> Do you know if the machine switch fixes it or the latest qemu version does?
> If it's the machine switch that would be fine, however asking for latest
> qemu might not be such a great idea since distributions lag quite a bit.
> Regards.
 
Okay, bad news. It is the latest qemu version fixing it.

Does any distribution have Qemu 2.5 included?

best regards
 Waldemar
