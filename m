From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Mar 2015 16:05:17 +0100
Subject: [Buildroot] [PATCH V2 1/2] tcl: add support for static builds
In-Reply-To: <20150307155634.605f5a68@free-electrons.com>
References: <1425734562-5312-1-git-send-email-Vincent.Riera@imgtec.com>	<20150307144233.5ee1db01@free-electrons.com>	<54FB0B22.8050604@imgtec.com>
 <20150307155634.605f5a68@free-electrons.com>
Message-ID: <54FB13AD.5080008@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,


On 07/03/15 15:56, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Sat, 7 Mar 2015 15:28:50 +0100, Vicente Olivert Riera wrote:
> 
>> I guess you could need tcl to build something that depends on it, and
>> link against libtcl8.6.a, for instance.
> 
> If you need tcl to build something, then it's the host tcl, not the
> target tcl.

uhm..., I'm sorry but I don't understand what you mean.

If you have a package that depends on tcl (it links against libtcl8.6.a,
for instance), then you will need the target tcl (actually the staging
one), which has the right architecture for your target, no? The host tcl
would have the same architecture as the host machine which may not be
the same as the target one.

Am I missing anything?

Regards,
--
Vincent


> Thomas
> 
