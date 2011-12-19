From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Dec 2011 08:30:27 +0100
Subject: [Buildroot] quick steps for buildroot?
In-Reply-To: <1324175614.84733.YahooMailNeo@web161206.mail.bf1.yahoo.com>
References: <1324175614.84733.YahooMailNeo@web161206.mail.bf1.yahoo.com>
Message-ID: <201112190830.27132.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 18 December 2011 03:33:34 Tim Judd wrote:
> I've been using buildroot to generate a i486 toolchain because I don't know how to do it myself.
> 
> 
> Would anyone be gentle enough to paraphrase/quick steps (no details necessary) of what tools to use, in the right order?  I'm savvy enough to understand how in a list of items how they're put together, but I don't know what I need.

 Download crosstool-NG and use its configure mechanism to create a cross-toolchain.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
