From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 22:12:16 +0200
Subject: [Buildroot] [PATCH 1/3] package/libupnp18: security bump to
 version 1.14.0
In-Reply-To: <ee168046-5a2e-537c-8df2-9c4fd00bb757@mind.be> (Arnout
 Vandecappelle's message of "Sun, 30 Aug 2020 20:34:06 +0200")
References: <20200821204139.3682940-1-fontaine.fabrice@gmail.com>
 <ee168046-5a2e-537c-8df2-9c4fd00bb757@mind.be>
Message-ID: <87lfhubmn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 21/08/2020 22:41, Fabrice Fontaine wrote:
 >> Fix CallStranger a.k.a. CVE-2020-12695 as well as CVE-2020-13848

 >  Again, although this bump indeed fixes those issues, it's a feature version
 > bump so I'm not sure if it can be called "security bump".

 >  In addition, the libupnp18 package exists because of API incompatibility with
 > 1.6. Are we sure that this problem doesn't repeat itself for 1.14?

And calling it libupnp18 when it is provides 1.14.x is quite confusing
:/

-- 
Bye, Peter Korsgaard
