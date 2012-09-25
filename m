From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Sep 2012 15:48:52 +0200
Subject: [Buildroot] Kernel version
In-Reply-To: <1348574267.95909.YahooMailNeo@web164603.mail.gq1.yahoo.com>
References: <1348517486.7248.YahooMailNeo@web164604.mail.gq1.yahoo.com>
 <5060CF90.7070605@mind.be>
 <1348558164.41699.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <5061687D.8090703@mind.be>
 <1348574267.95909.YahooMailNeo@web164603.mail.gq1.yahoo.com>
Message-ID: <5061B644.9020306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/25/12 13:57, Zoran Djordjevic wrote:
> Forgive me for repeating my mail, because I forgot CC info in previous mail.
> Now I correct that.
> In that case, can you tell me your proposal regarding kernel versions and
> tslib problem. To remind you - my board has 2.6.32 kernel version and
> I use Crosstool-NG.
> What shoud I choose in Buildroot menu and also in Crosstool-NG menu ?

  If you have no need to rebuild the kernel, the easiest is to leave the kernel
build out of buildroot, and select the custom kernel dir option in crosstool-NG.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
