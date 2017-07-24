From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jul 2017 00:54:30 +0200
Subject: [Buildroot] [git commit] support/testing: add test of
 BR2_CCACHE with an external toolchain
In-Reply-To: <20170724175458.GF2918@scaer>
References: <20170724163121.A64CB81DD3@busybox.osuosl.org>
 <20170724175458.GF2918@scaer>
Message-ID: <86ba6b0f-662b-ebd9-868f-a422e46821cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-07-17 19:54, Yann E. MORIN wrote:
[snip]
> You don't need to list all tests in there, if you want to execute all
> of them.i

 I think Thomas first implemented it that way. But then gitlab-CI just reports a
single pass/fail for the entire test suite, without details about what failed.
AFAIK gitlab-CI reporting doesn't have xUnit integration that could be used to
report detailed results from a single run.


 Regards,
 Arnout

> Instead, you can just list 'tests' and all sub-tests will be run by
> nose2. This way we need not update this file with every new test that we
> add. And in fact I think we should not even need to list it, and make
> the runtime-test entry just run everything...
> 
> I think it is even possible to mark some tests with 'test campaign tag'
> so that they are only executed under some conditions that we define
> ourselves (like, 'nightly', 'weekly', but also like 'arm', 'mips' or
> whatever 'tag' we're interested in). If you think it might be usefull,
> I can research that further...

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
