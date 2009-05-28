From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 28 May 2009 11:54:59 -0300
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <87ws8176y8.fsf@macbook.be.48ers.dk>
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272131h4aac2dceh86b7b8636031dc7d@mail.gmail.com>
	<87ws8176y8.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905280754t3d6b5d25y95aefc7b65ed4ded@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, May 28, 2009 at 9:22 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Paul" == Paul Archer <ptarcher@gmail.com> writes:
>
> Seems like we'll have to make ubifsroot as broken for the 2009.05
> release :/
>

Anything wrong with Paul's patch? It does look better than what I was
doing (duplicating the mkfs.jffs2 rules for a mkfs.ubifs).

Basically, what needs fixing is getting mkfs.ubifs for the host, it
was previously built by ubifs.mk from a user's tree, and now it's in
the main mtdutils tree as part of the distribuition. Unfortunally
there is no release containing it yet.

Kind Regards,
   Thiago A. Correa
