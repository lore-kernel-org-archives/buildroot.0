From: anisse at astier.eu <anisse@astier.eu>
Date: Thu, 19 Jul 2018 13:55:06 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: Avoid absolute path to python
 in shebang
In-Reply-To: <87va9bcwr9.fsf@dell.be.48ers.dk>
References: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
 <20180718171843.5ed5f10c@windsurf>
 <20180719075842.k3gxopajcat7f4dt@bifrost>
 <87va9bcwr9.fsf@dell.be.48ers.dk>
Message-ID: <20180719115506.5lyyqwk2betdivo7@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 19, 2018 at 01:04:10PM +0200, Peter Korsgaard wrote:
> >>>>> "Anisse" == Anisse Astier <anisse@astier.eu> writes:
> 
>  > Hi,
>  > We just hit this issue with the buildroot-2018.02 branch. Is this is the
>  > scope of LTS-backportable patches ?
> 
>  > Otherwise it's very easy to take the patch in an external, but I'm
>  > guessing it might break other builds somewhere.
> 
> Yes, I'll backport to 2018.02.x and 2018.05.x. I'm running a bit behind
> though (synched around July 1st), so it will take a few days.
> 
> Does the patch apply as is to 2018.02.x? Have you verified that it fixes
> the issue for you on 2018.02.x?

Yes, I have verified that the patch applies cleanly to libglib2 2.54.2
(the version in the 2018.02.x branch), and that it fixes the build of
json-glib, a package that was affected by the issue.

Regards,

Anisse
