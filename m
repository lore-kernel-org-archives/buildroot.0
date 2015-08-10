From: Simon Marchi <simon.marchi@polymtl.ca>
Date: Sun, 9 Aug 2015 23:11:03 -0400
Subject: [Buildroot] [PATCH] ola: Add patch to fix linking issue
In-Reply-To: <20150808124445.79092e05@free-electrons.com>
References: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
 <20150808124445.79092e05@free-electrons.com>
Message-ID: <CAFXXi0mu73=5UC6=n60uNZd=eUb16ns6vtxMH756MGuTDRhvFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8 August 2015 at 06:44, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Could you report the problem to the upstream ola project and see what
> they say? Also, they have a 0.9.7 release, maybe you want to try it?

I discussed it a bit on their IRC channel, it seems like the right fix
will be to move the implementations to the .cpp files.

I filed a bug: https://github.com/OpenLightingProject/ola/issues/880

The 0.9.7 release does not change anything about that problem, but we
could still bump the version. I am preparing a patch to cleanup the
plugin management of the package, if it hasn't been bump by the time I
send my patch, I'll do it then.
