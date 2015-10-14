From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Oct 2015 23:55:54 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: bypass buildroot
 wrapper
In-Reply-To: <20151014233106.416d10e6@free-electrons.com>
References: <20151011120859.7e786a73@free-electrons.com>
 <1444856755-2011-1-git-send-email-arnout@mind.be>
 <1444856755-2011-2-git-send-email-arnout@mind.be>
 <20151014233106.416d10e6@free-electrons.com>
Message-ID: <561ECF6A.5000908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-10-15 23:31, Thomas Petazzoni wrote:
> Arnout,
> 
> On Wed, 14 Oct 2015 23:05:55 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> Lightly tested with an internal toolchain, an external Sourcery
>> toolchain, an external downloaded buildroot toolchain, and an external
>> pre-installed buildroot toolchain.
> 
> Did you test with a pre-existing Buildroot toolchain (i.e that predates
> the introduction of the wrapper for internal toolchain), or did you
> build a Buildroot toolchain with the latest Buildroot (including your
> patches) and then re-used it as an external toolchain in another
> Buildroot configuration ?

 I built a toolchain with buildroot, i.e. including wrapper and .br_real, tarred
it and downloaded it.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
