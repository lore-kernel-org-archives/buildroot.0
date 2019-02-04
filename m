From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 17:10:29 +0100
Subject: [Buildroot] [PATCH v2 1/1] toolchain: update AArch32/AArch64
 toolchains to 8-2-2019.01
In-Reply-To: <3dc4fb0a-29e9-28a3-b154-e2d9cc9abe5d@mind.be> (Arnout
 Vandecappelle's message of "Mon, 4 Feb 2019 13:42:07 +0100")
References: <20190128133500.7515-1-joakim.bech@linaro.org>
 <20190128170533.16555-1-joakim.bech@linaro.org>
 <f01f063d-4b46-62b9-12f4-1cba370a3029@mind.be>
 <20190129102608.4k3wfli3dyomb7aa@debby>
 <1e40561f-02d9-c356-8630-c301251048ff@mind.be>
 <2f050b43-578d-2208-1cc6-e81df01f8b6d@mind.be>
 <87r2cnx3vf.fsf@dell.be.48ers.dk>
 <3dc4fb0a-29e9-28a3-b154-e2d9cc9abe5d@mind.be>
Message-ID: <87sgx3ttze.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >  That said, the part that adds support for 5.0 kernel headers is certainly
 >> > something we'd like to have in the 2019.02 LTS.
 >> 
 >> Why? 5.0 is not released yet, and will not become a LTS release.

 >  It is likely that people will use a 5.0 kernel during the LTS cycle, and that
 > they will use HEADERS_AS_KERNEL.

And 5.1,2,3,.. - E.G. 2018.02.x only had up to 4.15, even though 5.0
will probably get released before 2018.02 goes EOL.

 >  Actually, we should have have a _REALLY_NEW option for custom headers, just
 > like we have _REALLY_OLD.

Yes, that would be nice.

-- 
Bye, Peter Korsgaard
