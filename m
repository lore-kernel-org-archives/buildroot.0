From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 00:21:26 +0200
Subject: [Buildroot] version of ps
In-Reply-To: <558C0634.8060001@green-communications.fr>
References: <558C0634.8060001@green-communications.fr>
Message-ID: <558C7EE6.8080903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/15 15:46, Sylvain Raybaud wrote:
> Hi,
> 
> I need to run ps with an option (-p) which is not supported by the
> default busybox version. I see in busybox.config that many options for
> ps aren't enabled:
> 
> # CONFIG_FEATURE_PS_WIDE is not set
> # CONFIG_FEATURE_PS_LONG is not set
> # CONFIG_FEATURE_PS_TIME is not set
> # CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
> # CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
> 
> One of these options probably does the thing (I've not really check
> yet). If this is the case, I can either propose a patch to enable it
> or add a runtime dependency to PROCPS_NG in my package. What do you
> think is best?

 You can also define a custom busybox configuration file.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150626/19bc8310/attachment.asc>
