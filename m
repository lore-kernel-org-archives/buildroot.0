From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 22:17:32 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <096b2356-52d1-ee4d-0dc4-504d4a0dfee7@mind.be> (Arnout
 Vandecappelle's message of "Thu, 1 Mar 2018 20:41:13 +0100")
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <87fu5nsyrg.fsf@dell.be.48ers.dk>
 <20180226140029.45325514@windsurf.lan>
 <87bmgbsv4z.fsf@dell.be.48ers.dk>
 <20180226154724.4e87f072@windsurf.lan>
 <877eqzshgt.fsf@dell.be.48ers.dk>
 <096b2356-52d1-ee4d-0dc4-504d4a0dfee7@mind.be>
Message-ID: <87inafh4wj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Makes me think that we won't be able to do a good job supporting it
 >> throughout the 2018.02 support cycle.

 >  Well, for most packages, the "support" is limited to "it's still there and it
 > still doesn't fail in autobuilders".

I was hoping for a bit more than that, E.G. has no known security
issues.


 > Which will not happen because we don't use any new toolchains or
 > anything during the LTS support cycle.

Unless there is a security issue in one of the libraries it uses (like
openssl) and we need to bump the version to fix that issue.


 >> We don't have a good way of handling deprecations, so I'm not sure what
 >> the best option is:
 >> 
 >> - Do nothing
 >> - Change prompt to "Qt (obsolete)"

 >  I like this one. It costs us nothing, it makes it clear that you can't expect
 > support updates on this package, and it's an advance warning that it may be removed.

Ok, I'll send a patch.


 >> - Remove package

 >  Eventually, yes, with legacy handling. I would remove it only when it breaks.

Ok.


-- 
Bye, Peter Korsgaard
