From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Nov 2016 13:27:38 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <20161123132259.47f9a228@free-electrons.com>
References: <20161123111404.20661-1-arnout@mind.be>
 <20161123132259.47f9a228@free-electrons.com>
Message-ID: <bad536b8-2eac-6ea8-f7b7-8297a5c01b85@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-11-16 13:22, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 23 Nov 2016 12:14:04 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> We should also remove the 4.3 and 4.4 options, because they are
>> currently unused and also untested in the autobuilders.
> 
> The Blackfin ADI toolchains use gcc 4.3, if I remember correctly.

 Sorry, let me correct my statement: because they are currently unused by any
package and will very soon be untested in the autobuilders.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
