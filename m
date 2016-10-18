From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 11:54:02 +0200
Subject: [Buildroot] any opinions on uClibc-ng test-suite?
In-Reply-To: <20161018114849.2c1a2cd2@free-electrons.com>
References: <20161017184120.GM21808@waldemar-brodkorb.de>
 <bf1755cb-2741-5c6b-9b35-6eac1426a81b@mind.be>
 <20161018114849.2c1a2cd2@free-electrons.com>
Message-ID: <5ab72170-d579-8390-9ef2-dd31418f9688@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-10-16 11:48, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 17 Oct 2016 23:08:31 +0200, Arnout Vandecappelle wrote:
> 
>>  Normally I prefer that the test suite stays with the package.
> 
> Well, I agree in general. But for C library tests, it's a bit annoying
> when they are bundled with the C library source code itself. Indeed,
> this prevents from building those tests in an external toolchain
> scenario.
> 
> So I actually find having tests separate from the C library tarball a
> nicer way, as it allows to package them very easily, and use them even
> with external toolchains.

 Ack that.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
