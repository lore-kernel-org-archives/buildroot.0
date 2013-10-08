From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 8 Oct 2013 09:55:24 -0500
Subject: [Buildroot] [PATCH v3 01/11] udev: explicitly include pthreads
In-Reply-To: <87li2am6j0.fsf@dell.be.48ers.dk>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
 <1380237714-2470-2-git-send-email-spenser@gillilanding.com>
 <87li2am6j0.fsf@dell.be.48ers.dk>
Message-ID: <CAEBucnDSVnod2rt6y2AaT+XpnOtnmk=zKapM2hXChasjdXHqLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
>
>  Spenser> This fixes builds with Linaro hard float toolchains.
>
> Sorry, what toolchain exactly? I just did a test build with our default
> (Linaro 2013.08) ext toolchain, and didn't have any linker issues.

This has been occurring with the Linaro 2013.06 toolchain.  I'll test
with the 2013.08 toolchain.  I'm not sure why the 2013.06 was chosen
by default.

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
