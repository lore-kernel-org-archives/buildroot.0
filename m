From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 18:22:11 +0200
Subject: [Buildroot] qt-4.8.7 ICE on powerpc [was:
 [autobuild.buildroot.net] Build results for 2018-05-31]
In-Reply-To: <ab7f66ca-8e03-2b77-0a33-81934133c6f0@mind.be> (Arnout
 Vandecappelle's message of "Thu, 7 Jun 2018 23:48:39 +0200")
References: <20180601060027.2921620828@mail.bootlin.com>
 <a3c7791c-7502-5ce2-9677-355105fd23ec@mind.be>
 <20180601110638.5c41eacf@windsurf>
 <bd26e178-b204-056d-3646-7ececd9964d5@mind.be>
 <20180601142401.63697c3b@windsurf>
 <ab7f66ca-8e03-2b77-0a33-81934133c6f0@mind.be>
Message-ID: <87muw55jv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> If a single bug report contains multiple bugs, then our
 >> BR2_TOOLCHAIN_GCC_HAS_BUG_xyz naming has a serious problem :-)
 >> 
 >> Is this specific Qt4 issue resolved with gcc 7.x ? Some testing on this
 >> would be nice.

 >  Since this is about Qt4 which is EOL since 3 years, perhaps we can just exclude
 > Qt4 entirely for powerpc? I think powerpc with UI is rather rare anyway...

Or perhaps simply get rid of Qt4? It is still available in 2018.02.x,
and we should probably get rid of it before 2019.02.

-- 
Bye, Peter Korsgaard
