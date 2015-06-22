From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Mon, 22 Jun 2015 12:01:56 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
 and theirs local dependencies
In-Reply-To: <20150616163054.GA4861@dkarchlinux64.currentcomm.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
 <20150616163054.GA4861@dkarchlinux64.currentcomm.com>
Message-ID: <5587DD14.2020001@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/16/2015 06:30 PM, rdkehn at yahoo.com wrote:
> make[3]: Nothing to be done for 'all'.
>>>> test 1.0.0 Installing to target
>
> I was expecting libtest.c in libtest to be rebuilt and all of test
> to be rebuilt.  A second execution of 'make test-rebuild' does
> perform the expected steps.  ...interesting.
>
> I apologize if I've mucked this whole thing up.  These were just my
> observations for an interesting patch that followed a similar work
> flow.
>
> Regards,
> ...doug
>

Hi doug,

Indeed. There is a big problem with my patch. I believed the job was 
done and rebuild the package and these dependencies if change was found 
but it doesn't. I'm disappointed. I pushed the patch too quickly.

I'm trying to find a new way to implement my needs.

Regards,
Anthony.
