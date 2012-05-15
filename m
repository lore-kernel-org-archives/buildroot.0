From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 May 2012 20:53:36 +0200
Subject: [Buildroot] [PATCH] pkg-infra: remove the call from XXXTARGETS
In-Reply-To: <20120514115844.3631e856@skate>
References: <1336857045-10679-1-git-send-email-arnout@mind.be>
 <20120514095846.7d206d16@skate> <4FB0C31D.9080101@mind.be>
 <20120514115844.3631e856@skate>
Message-ID: <CAAXf6LUdZS2Ezon-K6WiBvUft5JE3nbAEucb=MO7crvjsYTRog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 14, 2012 at 11:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 14 May 2012 10:32:29 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>> ? autotools-package / host-autotools-package
>> ? generic-package / host-generic-package
>> ? cmake-package / host-cmake-package
>
> I'm fine with those. But then, maybe we need to rename
> pkg-cmaketargets.mk to something like pkg-cmake.mk or another idea
> (because the "targets" part of the name would no longer make much
> sense).

I'm also fine with this new naming, and with the renaming of the .mk
files to pkg-cmake.mk, pkg-generic.mk, and pkg-autotools.mk

Best regards,
Thomas
