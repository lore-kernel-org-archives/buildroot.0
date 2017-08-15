From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:22:02 +0200
Subject: [Buildroot] [PATCH 3/3] whois: bump to version 5.2.17
In-Reply-To: <b5c9e26c4b8e652827b9d04dad2f821a329c3249.1502649259.git.baruch@tkos.co.il>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <b5c9e26c4b8e652827b9d04dad2f821a329c3249.1502649259.git.baruch@tkos.co.il>
Message-ID: <c6c5ba20-6b55-bb90-e4c3-2a90814adc95@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-08-17 20:34, Baruch Siach wrote:
> Fixes serious usability issues (Debian changelog):
> 
>   * Fixed whois referrals for .com, .net, .jobs, .bz, .cc and .tv,
>     broken by an ICANN-mandated output change:
>     https://www.icann.org/resources/pages/rdds-labeling-policy-2017-02-01-en
> 
> Use snapshot.debian.org for the .dsc reference, since files tend to
> disappear from the official Debian ftp site over time.
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 As mentioned before, applied to master, thanks.

 I first checked the differences between 5.2.14 and 5.2.17, and it really is
only in the whois databases (and in documentation) that there are changes.
Source code hasn't changed.

 Peter, this should probably go to the LTS branches as well.

 Regards,
 Arnout

> ---
> 
> This should go to master IMO.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
